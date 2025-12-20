class ApplicationMailer < ActionMailer::Base
  default from: ENV.fetch("MAILER_FROM_ADDRESS", "We Use Rails <support@weuserails.com>")
  layout "mailer"
end
