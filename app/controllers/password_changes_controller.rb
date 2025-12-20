class PasswordChangesController < ApplicationController
  def update
    if Current.user.authenticate(password_params[:current_password])
      if password_params[:new_password] == password_params[:new_password_confirmation]
        if Current.user.update(password: password_params[:new_password])
          redirect_to profile_url, notice: "password updated."
        else
          redirect_to edit_profile_url, alert: "failed to update password."
        end
      else
        redirect_to edit_profile_url, alert: "new passwords do not match."
      end
    else
      redirect_to edit_profile_url, alert: "incorrect current password."
    end
  end

  private

  def password_params
    params.require(:user).permit(:current_password, :new_password, :new_password_confirmation)
  end
end
