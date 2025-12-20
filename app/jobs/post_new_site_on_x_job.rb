require "open-uri"
require "x/media_uploader"

class PostNewSiteOnXJob < ApplicationJob
  include Rails.application.routes.url_helpers

  queue_as :default

  retry_on X::TooManyRequests, wait: :polynomially_longer, attempts: 20 do |job, error|
    reset_time = nil
    wait_seconds = nil
    begin
      if error.response&.headers&.key?("x-rate-limit-reset")
        reset_time = Time.at(error.response.headers["x-rate-limit-reset"].to_i)
        wait_seconds = [ (reset_time - Time.now).to_i, 0 ].max
      else
        # Fallback: try v2 rate limit endpoint or assume 24-hour reset
        x_client = X::Client.new(**CREDENTIALS)
        status = x_client.get("rate_limit") rescue nil
        if status && status["rate_limit_context"] && status["rate_limit_context"]["reset"]
          reset_time = Time.at(status["rate_limit_context"]["reset"])
          wait_seconds = [ (reset_time - Time.now).to_i, 0 ].max
        else
          # Assume daily reset at 00:00 UTC
          reset_time = (Time.now.utc + 1.day).beginning_of_day
          wait_seconds = [ (reset_time - Time.now).to_i, 0 ].max
        end
      end
      Rails.logger.warn("Rate limit hit. Reset at #{reset_time} (#{wait_seconds}s). Retrying.")
    rescue StandardError => e
      Rails.logger.warn("Rate limit hit, failed to fetch reset time: #{e.message}. Retrying.")
    end
    Rails.logger.warn("Rate limit hit, no reset time available. Retrying.") unless reset_time
  end

  CREDENTIALS = {
    api_key: ENV["X_API_KEY"],
    api_key_secret: ENV["X_API_KEY_SECRET"],
    access_token: ENV["X_ACCESS_TOKEN"],
    access_token_secret: ENV["X_ACCESS_TOKEN_SECRET"]
  }.freeze

  def perform(site)
    text = "#{site.title}: #{site.tagline}\n\n#{web_app_url(site, host: "https://weuserails.com")}"
    x_client = X::Client.new(**CREDENTIALS)
    media_id = nil
    begin
      og = OpenGraph.new(site.url, read_timeout: 10)
      if og.images.any? && (image = og.images.first)
        image_url = image.respond_to?(:url) ? image.url : image
        media_id = upload_image(image_url, x_client)
        Rails.logger.info("Uploaded OG image for #{site.url}: media_id=#{media_id}")
      end
    rescue StandardError => e
      Rails.logger.warn("Failed to fetch/upload OG image for #{site.url}: #{e.message}")
    end

    payload = { text: text }
    payload[:media] = { media_ids: [ media_id ] } if media_id
    x_client.post("tweets", payload.to_json)
  end

  private

  def upload_image(image_url, x_client)
    tempfile = Tempfile.new([ "og_image", ".jpg" ])
    begin
      tempfile.binmode
      URI.open(image_url, "rb") { |download| IO.copy_stream(download, tempfile) }
      tempfile.rewind
      raise "Image too large" if tempfile.size > 5_000_000
      result = X::MediaUploader.upload(client: x_client, file_path: tempfile.path, media_category: "tweet_image")
      Rails.logger.info("Upload response: #{result}")
      result["id"] || raise("No id in response: #{result}")
    ensure
      tempfile.close
      tempfile.unlink
    end
  end
end
