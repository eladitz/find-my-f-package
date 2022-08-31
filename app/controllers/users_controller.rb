class UsersController < ApplicationController
  def profile
    @packages = Package.where(["user_receiver_id = ?", current_user.id])
    @packages_receiver = Package.where(["user_owner_id = ?", current_user.id])
  end

  def adding_profile_form

  end

  def adding_profile_info
    if current_user.present?
      @user = current_user
      @user.update(user_params)
      redirect_to(user_address_path)
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name)
  end
end
