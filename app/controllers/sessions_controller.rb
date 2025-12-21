class SessionsController < ApplicationController
  include Turnstile

  allow_unauthenticated_access only: %i[ new create ]
  rate_limit to: 10, within: 3.minutes, only: :create, with: -> { redirect_to new_session_url, alert: "try again later." }

  before_action :redirect_if_authenticated, only: %i[ new create ]
  before_action :verify_turnstile, only: :create, if: -> { Rails.env.production? && !turnstile_allowed? }

  # <rails-lens:routes:begin>
  # ROUTE: /session/new, name: new_session, via: GET
  # <rails-lens:routes:end>
  def new
  end

  # <rails-lens:routes:begin>
  # ROUTE: /session, name: session, via: POST
  # <rails-lens:routes:end>
  def create
    if user = User.authenticate_by(params.permit(:email_address, :password))
      start_new_session_for user
      ServiceMessages::NewUserJob.perform_now(user)
      redirect_to after_authentication_url, notice: "you have been signed in."
    else
      redirect_to new_session_url, alert: "Try another email address or password."
    end
  end

  # <rails-lens:routes:begin>
  # ROUTE: /session, name: session, via: DELETE
  # <rails-lens:routes:end>
  def destroy
    terminate_session
    redirect_to new_session_url, notice: "you have been signed out."
  end

  private

  def redirect_if_authenticated
    redirect_to after_authentication_url if authenticated?
  end
end
