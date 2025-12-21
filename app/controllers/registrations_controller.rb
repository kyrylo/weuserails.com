class RegistrationsController < ApplicationController
  include Turnstile

  allow_unauthenticated_access

  before_action :redirect_if_authenticated, only: %i[ new create ]
  before_action :verify_turnstile, only: :create, if: -> { Rails.env.production? && !turnstile_allowed? }

  # <rails-lens:routes:begin>
  # ROUTE: /registration/new, name: new_registration, via: GET
  # <rails-lens:routes:end>
  def new
    @user = User.new
  end

  # <rails-lens:routes:begin>
  # ROUTE: /registration, name: registration, via: POST
  # <rails-lens:routes:end>
  def create
    @user = User.new(user_params)
    if @user.save
      ServiceMessages::NewUserJob.perform_later(@user)
      start_new_session_for @user
      redirect_to new_site_url, notice: "Successfully signed up."
    else
      redirect_to new_registration_url, alert: @user.errors.first.full_message
    end
  end

  private

  def user_params
    params.require(:user).permit(:email_address, :password, :password_confirmation)
  end

  def redirect_if_authenticated
    redirect_to after_authentication_url if authenticated?
  end
end
