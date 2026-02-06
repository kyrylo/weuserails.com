class TelegramBotService < ApplicationService
  BASE_URL = "https://api.telegram.org/bot"

  def initialize(message)
    super

    @message = message
    @token = ENV["TELEGRAM_BOT_TOKEN"]
    @chat_id = ENV["TELEGRAM_BOT_CHAT_ID"]
  end

  def call
    url = URI("#{BASE_URL}#{@token}/sendMessage")
    params = {
      chat_id: @chat_id,
      text: @message,
      parse_mode: "HTML"
    }

    uri = URI(url)
    uri.query = URI.encode_www_form(params)

    response = Net::HTTP.get_response(uri)

    return if response.is_a?(Net::HTTPSuccess)

    Rails.logger.error "Failed to send Telegram bot message. Status code: #{response.code}, Body: #{response.body}"
  end
end
