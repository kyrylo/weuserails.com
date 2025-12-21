# <rails-lens:mailers:begin>
# DELIVERY_METHOD: smtp
# LOCALES: en
# DEFAULTS: from: We Use Rails <support@weuserails.com>, layout: mailer
# <rails-lens:mailers:end>
class PasswordsMailer < ApplicationMailer
  def reset(user)
    @user = user
    mail subject: "Reset your password", to: user.email_address
  end
end
