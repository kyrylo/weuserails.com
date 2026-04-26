class SiteMailer < ApplicationMailer
  include ApplicationHelper
  helper :application

  def published_email
    @site = params[:site]
    @user = @site.user
    mail(to: @user.email_address, subject: "#{@site.title} now featured on We Use Rails", from: ENV.fetch("SMTP_USERNAME"))
  end

  def rails_confirmation_email
    @site = params[:site]
    @user = @site.user
    mail(to: @user.email_address, subject: "#{@site.title} confirmation of Ruby on Rails usage", from: ENV.fetch("SMTP_USERNAME"))
  end
end
