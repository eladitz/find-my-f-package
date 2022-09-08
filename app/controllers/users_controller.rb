class UsersController < ApplicationController
  def profile
    @packages = Package.where(["user_receiver_id = ?", current_user.id])
    @packages_receiver = Package.where(["user_owner_id = ?", current_user.id])
    @address = Address.find(current_user.address_id)
  end

  def print_page
    @package = Package.find_by(["user_receiver_id = ?", current_user.id])
    if @package.not_register_user_name
      @package_owner = @package.not_register_user_name
    else
      @package_owner = User.find(@package.user_owner_id)
    end
    @package_receiver = current_user.id
    @address = Address.find(current_user.address_id)
  end



  def adding_profile_form
    if current_user.address_id.present?
      redirect_to(profile_path)
    end
  end

  def adding_profile_info
    if current_user.present? && !current_user.address_id.present?
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
