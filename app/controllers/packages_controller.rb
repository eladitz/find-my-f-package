require 'json'

class PackagesController < ApplicationController
  def received
    if params[:query].present?
      temp_user = params[:query].split
      @users = User.where('first_name ILIKE ? AND last_name ILIKE ?',
                          "%#{temp_user[0]}%", "%#{temp_user[1]}%")

      if @users.count.zero?
        @package = Package.new(user_receiver_id: current_user.id,
                               address_id: current_user.address_id,
                               not_register_user_name: params[:query])

        @package.save
        redirect_to(availability_path(@package.id), notice: "A package was added but owner still not in our system,
                                              they will be informed as soon as he join")
      else
        @package = Package.new(user_owner_id: @users[0].id,
                               user_receiver_id: current_user.id,
                               address_id: current_user.address_id)

        @package.save
        redirect_to(availability_path(@package.id), notice: "A package was added and owner will be informed")
      end
    end
  end

  def find
  end

  def availability
    if params[:availability].present?
      @currentPackage = Package.find(params[:id])
        @currentPackage.update(availability: params[:availability])

      if params[:comment].present?
        @currentPackage.update(comment: params[:comment])
      end
      @currentPackage.save
      redirect_to(profile_path, notice: "Your availability info was added")
    end
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
