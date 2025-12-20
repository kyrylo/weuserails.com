module Turnstile
  private

  def verify_turnstile
    unless turnstile_success?(params["cf-turnstile-response"])
      redirect_to new_registration_url, alert: "captcha verification failed. please try again."
    end
  end

  def turnstile_success?(token)
    return false if token.blank?

    response = Net::HTTP.post_form(
      URI("https://challenges.cloudflare.com/turnstile/v0/siteverify"),
      secret: ENV["TURNSTILE_SECRET_KEY"],
      response: token,
      remoteip: request.remote_ip
    )

    body = JSON.parse(response.body)
    Rails.logger.info "Turnstile response: #{body}"
    body["success"] == true
  rescue => e
    Rails.logger.error "Turnstile error: #{e.message}"
    false
  end

  def turnstile_allowed?
    firefox_browser? || mobile_safari?
  end

  def firefox_browser?
    request.user_agent.to_s.downcase.include?("firefox")
  end

  def mobile_safari?
    ua = request.user_agent.to_s.downcase
    ua.include?("safari") && ua.include?("mobile")
  end
end
