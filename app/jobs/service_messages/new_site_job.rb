module ServiceMessages
  class NewSiteJob < ApplicationJob
    queue_as :default

    def perform(site)
      message_html = <<~HTML
        <b>🌐 New site</b>

        <b>ID:</b> #{site.id}
        <b>Title:</b> #{site.title}
        <b>URL:</b> #{site.url}
        <b>Tagline:</b> #{site.tagline}

        #new_site
      HTML

      TelegramBotService.call(message_html)
    end
  end
end
