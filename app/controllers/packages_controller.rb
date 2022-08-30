class PackagesController < ApplicationController
  def received
    @users = User.all
    if params[:query].present?
      tempUser = params[:query].split
      @user = User.where('first_name ILIKE ? AND last_name ILIKE ?', "%#{tempUser[0]}%", "%#{tempUser[1 ]}%")

      # TODO get user address id and user id, create a new package 
      @package = Package.new

    end
  end

  def find
  end
end
