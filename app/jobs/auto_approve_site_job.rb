require "open-uri"
require "nokogiri"
require "uri"

class AutoApproveSiteJob < ApplicationJob
  queue_as :default

  SIGNIN_PATH_PATTERNS = [
    %r{/(?:users/)?(?:sign_?in|login|signin|log_in|sign-in|log-in)},
    %r{/account/(?:login|sign_in|signin)},
    %r{/auth/(?:login|sign_in|signin)},
    %r{/(?:admin/)?(?:login|sign_in)}
  ].freeze

  LOGIN_TEXT_PATTERNS = [
    /sign in/i,
    /log in/i,
    /login/i,
    /sign up/i
  ].freeze

  MAX_SIGNIN_CHECKS = 3

  def perform(site)
    return if site.published_at.present?

    main_html = fetch_html(site.url)
    if main_html && rails_indicator?(main_html)
      approve_site(site, checked_page: site.url)
      send_approval_telegram_message(site, checked_page: site.url)
    else
      signin_urls = potential_signin_urls(main_html, site.url)
      approved = false
      checked_page = nil

      signin_urls.first(MAX_SIGNIN_CHECKS).each do |signin_url|
        signin_html = fetch_html(signin_url)
        if signin_html && rails_indicator?(signin_html)
          approved = true
          checked_page = signin_url
          break
        end
      end

      if approved
        approve_site(site, checked_page: checked_page)
        send_approval_telegram_message(site, checked_page: checked_page)
      else
        send_manual_review_telegram_message(site)
        SiteMailer.with(site: site).rails_confirmation_email.deliver_later
      end
    end
  end

  private

  def fetch_html(url)
    return nil unless url

    URI.open(url.to_s, read_timeout: 10) do |f|
      f.read
    rescue OpenURI::HTTPError => e
      if e.io.status.first == "404"
        Rails.logger.warn("Page not found: #{url}")
      else
        Rails.logger.error("HTTP error fetching #{url}: #{e.message}")
      end
      nil
    rescue Timeout::Error, Net::OpenTimeout, Net::ReadTimeout => e
      Rails.logger.warn("Timeout fetching #{url}: #{e.message}")
      nil
    rescue StandardError => e
      Rails.logger.error("Failed to fetch #{url}: #{e.message}")
      nil
    end
  end

  def rails_indicator?(html)
    html.include?('<meta name="csrf-param" content="authenticity_token"')
  end

  def potential_signin_urls(html, base_url)
    return [] unless html && base_url

    doc = Nokogiri::HTML(html)
    potentials = Set.new

    # Find links matching path patterns
    doc.css("a[href]").each do |link|
      href = link["href"]
      next unless href

      full_url = resolve_url(href, base_url)
      next unless full_url

      SIGNIN_PATH_PATTERNS.each do |pattern|
        if pattern.match?(full_url.path)
          potentials.add(full_url.to_s)
          break
        end
      end
    end

    # Find links matching text patterns (if no path matches, or to supplement)
    doc.css("a").each do |link|
      text = link.text.strip.downcase
      next unless text.present?

      full_url = resolve_url(link["href"], base_url)
      next unless full_url

      LOGIN_TEXT_PATTERNS.each do |text_pattern|
        if text_pattern.match?(text) && (full_url.path.to_s.include?("sign") || full_url.path.to_s.include?("login"))
          potentials.add(full_url.to_s)
          break
        end
      end
    end

    potentials.to_a
  end

  def resolve_url(relative_or_absolute, base_url)
    return unless relative_or_absolute

    uri = URI.parse(relative_or_absolute)
    full_uri = uri.absolute? ? uri : URI.join(base_url, relative_or_absolute)
    full_uri.scheme =~ /\Ahttps?\z/i ? full_uri : nil
  rescue URI::InvalidURIError
    nil
  end

  def approve_site(site, checked_page:)
    site.update!(published_at: Time.current)
    SiteMailer.with(site: site).published_email.deliver_later
    PostNewSiteOnXJob.perform_later(site)
    PostNewSiteOnBskyJob.perform_later(site)
    Rails.logger.info("Auto-approved site: #{site.title} (#{site.url}) via #{checked_page}")
  rescue StandardError => e
    Rails.logger.error("Failed to approve/post site #{site.id}: #{e.message}")
    site.update!(published_at: nil) if site.published_at.present?
  end

  def send_approval_telegram_message(site, checked_page:)
    page_note = checked_page == site.url ? "main page" : "sign-in page (#{checked_page})"
    message_html = <<~HTML
      <b>✅ Site Auto-Approved</b>

      <b>ID:</b> #{site.id}
      <b>Title:</b> #{site.title}
      <b>URL:</b> #{site.url}
      <b>Tagline:</b> #{site.tagline}
      <b>Status:</b> Auto-approved (Rails CSRF token detected on #{page_note})

      #site_approved
    HTML
    TelegramBotService.call(message_html)
  end

  def send_manual_review_telegram_message(site)
    message_html = <<~HTML
      <b>⚠️ Site Requires Manual Review</b>

      <b>ID:</b> #{site.id}
      <b>Title:</b> #{site.title}
      <b>URL:</b> #{site.url}
      <b>Tagline:</b> #{site.tagline}
      <b>Status:</b> No Rails CSRF token detected on main or potential sign-in pages, confirmation email sent

      #site_manual_review
    HTML
    TelegramBotService.call(message_html)
  end
end
