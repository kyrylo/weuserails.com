class PasswordsController < ApplicationController
  allow_unauthenticated_access
  before_action :set_user_by_token, only: %i[ edit update ]

  # <rails-lens:routes:begin>
  # ROUTE: /passwords/new, name: new_password, via: GET
  # <rails-lens:routes:end>
  def new
  end

  # <rails-lens:routes:begin>
  # ROUTE: /passwords, via: POST
  # <rails-lens:routes:end>
  def create
    if user = User.find_by(email_address: params[:email_address])
      PasswordsMailer.reset(user).deliver_later
    end

    redirect_to new_session_url, notice: "password reset instructions sent (if user with that email address exists)."
  end

  # <rails-lens:routes:begin>
  # ROUTE: /passwords/:token/edit, name: edit_password, via: GET
  # <rails-lens:routes:end>
  def edit
  end

  # <rails-lens:routes:begin>
  # ROUTE: /passwords/:token, via: [PATCH, PUT]
  # <rails-lens:routes:end>
  def update
    if @user.update(params.permit(:password, :password_confirmation))
      redirect_to new_session_url, notice: "password has been reset."
    else
      redirect_to edit_password_path(params[:token]), alert: "passwords did not match."
    end
  end

  private
    def set_user_by_token
      @user = User.find_by_password_reset_token!(params[:token])
    rescue ActiveSupport::MessageVerifier::InvalidSignature
      redirect_to new_password_path, alert: "password reset link is invalid or has expired."
    end
end
