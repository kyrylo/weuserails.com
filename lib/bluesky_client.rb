require "opengraph_parser"
require "open-uri"
require "tempfile"

class BlueskyClient
  API = URI("https://bsky.social")

  def initialize(handle:, app_password:)
    @handle = handle
    @app_password = app_password
    @jwt = nil
  end

  def login!
    uri = API + "/xrpc/com.atproto.server.createSession"
    res = Net::HTTP.post(
      uri,
      { identifier: @handle, password: @app_password }.to_json,
      "Content-Type" => "application/json"
    )
    raise "Login failed: #{res.body}" unless res.is_a?(Net::HTTPSuccess)

    body = JSON.parse(res.body)
    @jwt = body["accessJwt"]
  end

  def post(text, site:, link_url:)
    login! unless @jwt

    facets = build_facets(text, link_url)

    embed = nil
    og_image_url = fetch_og_image(site.url)
    if og_image_url
      blob_ref = upload_image(og_image_url)
      if blob_ref
        embed = {
          "$type" => "app.bsky.embed.images",
          images: [
            {
              image: blob_ref,
              alt: "#{site.title} image"
            }
          ]
        }
      end
    end

    record = {
      text: text,
      createdAt: Time.now.utc.iso8601,
      facets: facets
    }
    record[:embed] = embed if embed

    uri = API + "/xrpc/com.atproto.repo.createRecord"
    body = {
      repo: @handle,
      collection: "app.bsky.feed.post",
      record: record
    }

    req = Net::HTTP::Post.new(uri, {
      "Content-Type" => "application/json",
      "Authorization" => "Bearer #{@jwt}"
    })
    req.body = body.to_json

    res = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) { |http| http.request(req) }
    raise "Post failed: #{res.body}" unless res.is_a?(Net::HTTPSuccess)

    JSON.parse(res.body)
  end

  private

  def build_facets(text, url)
    return [] unless url && text.include?(url)

    start = text.index(url)
    [ {
      index: { byteStart: start, byteEnd: start + url.bytesize },
      features: [
        { "$type": "app.bsky.richtext.facet#link", uri: url }
      ]
    } ]
  end

  def fetch_og_image(url)
    og = OpenGraph.new(url, read_timeout: 10)
    og.images.first
  rescue => e
    Rails.logger.warn("No OG image for #{url}: #{e.message}")
    nil
  end

  def upload_image(image_url)
    tempfile = Tempfile.new([ "bsky_image", ".jpg" ])
    begin
      tempfile.binmode
      URI.open(image_url, "rb") { |download| IO.copy_stream(download, tempfile) }
      raise "Image too large" if tempfile.size > 1_000_000
      mime_type = Marcel::MimeType.for(tempfile) rescue "image/jpeg"
      file_content = tempfile.read

      uri = API + "/xrpc/com.atproto.repo.uploadBlob"
      req = Net::HTTP::Post.new(uri, {
        "Content-Type" => mime_type,
        "Authorization" => "Bearer #{@jwt}"
      })
      req.body = file_content

      res = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) { |http| http.request(req) }
      return nil unless res.is_a?(Net::HTTPSuccess)

      JSON.parse(res.body)["blob"]
    ensure
      tempfile.close
      tempfile.unlink
    end
  rescue => e
    Rails.logger.warn("Failed to upload image #{image_url}: #{e.message}")
    nil
  end
end
