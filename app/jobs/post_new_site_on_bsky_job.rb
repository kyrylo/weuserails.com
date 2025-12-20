class PostNewSiteOnBskyJob < ApplicationJob
  include Rails.application.routes.url_helpers
  queue_as :default

  retry_on StandardError, wait: :exponentially_longer, attempts: 20

  def perform(site)
    link_url = web_app_url(site, host: "https://weuserails.com")
    text = "#{site.title}: #{site.tagline}\n\n#{link_url}"
    text = text.encode("UTF-8", invalid: :replace, undef: :replace, replace: "")

    client = BlueskyClient.new(
      handle: ENV["BSKY_HANDLE"],
      app_password: ENV["BSKY_APP_PASSWORD"],
    )
    client.post(text, site: site, link_url: link_url)
  end
end
