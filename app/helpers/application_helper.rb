module ApplicationHelper
  include Turnstile

  def default_meta_tags
    {
      site: "We Use Rails",
      title: "Discover web apps built with Ruby on Rails",
      reverse: true,
      separator: "|",
      description: "We Use Rails highlights web apps using Ruby on Rails, from startups to enterprises. Explore web applications built with the Rails framework.",
      canonical: request.original_url,
      noindex: !Rails.env.production?,
      charset: "utf-8",
      icon: [
        { href: "/favicon.ico?v=2" },
        { href: "/apple-touch-icon-180x180.png", rel: "apple-touch-icon", sizes: "180x180", type: "image/png" }
      ],
      og: {
        site_name: "We Use Rails",
        title: "Discover web apps built with Ruby on Rails",
        description: "We Use Rails highlights web apps using Ruby on Rails, from startups to enterprises. Explore web applications built with the Rails framework.",
        type: "website",
        url: request.original_url,
        image: image_url("og.png?v=1")
      },
      twitter: {
        card: "summary_large_image",
        site: "@WeUseRails",
        title: "Discover web apps built with Ruby on Rails",
        description: "We Use Rails highlights web apps using Ruby on Rails, from startups to enterprises. Explore web applications built with the Rails framework.",
        image: image_url("og.png?v=1")
      }
    }
  end

  def schema_dot_org
    schema = SchemaDotOrg::WebSite.new(
      name: "We Use Rails",
      url: "https://weuserails.com"
    )
    schema.to_json_ld(pretty: false).html_safe
  end

  def smart_meta_description(site_description)
    return "" if site_description.blank?

    # Extract the first paragraph
    first_paragraph = site_description.split("\n").first.to_s.strip
    return "" if first_paragraph.blank?

    if first_paragraph.length > MetaTags.config.description_limit
      sentences = first_paragraph.split(/(?<=[.!?])\s+/)
      trimmed_description = ""

      sentences.each do |sentence|
        break if (trimmed_description + sentence).length > 300
        trimmed_description += sentence + " "
      end

      return trimmed_description.strip
    end

    first_paragraph
  end

  def add_ref_param(url)
    url + "?ref=weuserails.com"
  end

  def strip_url(url)
    url = "https://#{url}" unless url.match?(/\A\w+:\/\//)
    uri = URI.parse(url)
    host = uri.host
    host = host.sub(/\Awww\./, "") if host
    host
  rescue URI::InvalidURIError
    Sentry.capture_message("Invalid URL in strip_url: #{url}")
    url
  end
end
