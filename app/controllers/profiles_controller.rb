class ProfilesController < ApplicationController
  # <rails-lens:routes:begin>
  # ROUTE: /profile, name: profile, via: GET
  # <rails-lens:routes:end>
  def show
  end

  # <rails-lens:routes:begin>
  # ROUTE: /profile/edit, name: edit_profile, via: GET
  # <rails-lens:routes:end>
  def edit
  end

  # <rails-lens:routes:begin>
  # ROUTE: /profile, name: profile, via: [PATCH, PUT]
  # <rails-lens:routes:end>
  def update
    if Current.user.update(profile_params)
      redirect_to profile_path, notice: "email updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def profile_params
    params.require(:user).permit(:email_address)
  end
end
