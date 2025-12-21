# <rails-lens:mailers:begin>
# DELIVERY_METHOD: smtp
# LOCALES: en
# DEFAULTS: from: We Use Rails <support@weuserails.com>, layout: mailer
# <rails-lens:mailers:end>
class SiteMailer < ApplicationMailer
  include ApplicationHelper
  helper :application

  def published_email
    @site = params[:site]
    @user = @site.user
    mail(to: @user.email_address, subject: "#{@site.title} now featured on We Use Rails")
  end

  def rails_confirmation_email
    @site = params[:site]
    @user = @site.user
    mail(to: @user.email_address, subject: "#{@site.title} confirmation of Ruby on Rails usage")
  end
end
