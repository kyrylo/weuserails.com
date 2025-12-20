module ServiceMessages
  class NewUserJob < ApplicationJob
    queue_as :default

    def perform(user)
      message_html = <<~HTML
        <b>🎉 New user</b>

        <b>ID:</b> #{user.id}
        <b>Name:</b> #{user.full_name}
        <b>Email:</b> #{user.email_address}
        <b>Google ID:</b> #{user.google_id}

        #new_user
      HTML

      TelegramBotService.call(message_html)
    end
  end
end
