class PackagesController < ApplicationController
  def received
    if params[:query].present?
      temp_user = params[:query].split
      @users = User.where('first_name ILIKE ? AND last_name ILIKE ?',
                          "%#{temp_user[0]}%", "%#{temp_user[1]}%")

      if @users.count.zero?
        raise
      end
      @package = Package.new(user_owner_id: @users[0].id, user_reciever_id: current_user.id, address_id: current_user.address_id)
      @package.save
      redirect_to(profile_path, notice: "A package was added and owner will be informed")
    end
  end

  def find
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name)
  end

  def user_exist?(user1, user2)
    user1.first_name == user2.first_name &&
      user1.last_name == user2.last_name &&
      user1.address_id == user2.address_id
  end
end
