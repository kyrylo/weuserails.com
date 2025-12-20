# frozen_string_literal: true

class GoogleSessionsController < ApplicationController
  allow_unauthenticated_access only: :create

  before_action :verify_google_sign_in_key, only: :create
  before_action :set_google_identity, only: :create

  def create
    if flash["google_sign_in"]["error"]
      return redirect_to new_session_url, alert: flash["google_sign_in"]["error"]
    end

    @user = find_google_user || create_user
    start_new_session_for @user

    redirect_to after_authentication_url, notice: "you have been signed in."
  end

  private

  def find_google_user
    User.find_by(google_id: @google_identity.user_id)
  end

  def verify_google_sign_in_key
    return if flash.key?("google_sign_in") && flash["google_sign_in"].key?("id_token")

    redirect_to new_session_url, alert: "something went wrong."
  end

  def set_google_identity
    @google_identity = GoogleSignIn::Identity.new(flash["google_sign_in"]["id_token"])
  end

  def create_user
    user = User.create!(
      nickname: nickname,
      email_address: @google_identity.email_address,
      full_name: @google_identity.name,
      verified: @google_identity.email_verified?,
      google_id: @google_identity.user_id,
      avatar_url: @google_identity.avatar_url,
      data: @google_identity.to_json,
      password_digest: BCrypt::Password.create(SecureRandom.hex(16))
    )
    ServiceMessages::NewUserJob.perform_now(user)
    user
  end

  def nickname
    nickname = @google_identity.email_address.split("@").first
    if User.exists?(nickname: nickname)
      nickname = "#{nickname}-#{SecureRandom.hex(4)}"
    end
    nickname
  end
end
