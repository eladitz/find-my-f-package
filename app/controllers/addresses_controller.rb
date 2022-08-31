class AddressesController < ApplicationController
  def new
    @address = Address.new
  end

  def create
    @addresses = Address.where('country ILIKE ? AND city ILIKE ?
                               AND post_code ILIKE ?
                               AND street ILIKE ?
                               AND house_number ILIKE ?',
                               "%#{params[:country]}%",
                               "%#{params[:city]}%",
                               "%#{params[:post_code]}%",
                               "%#{params[:street]}%",
                               "%#{params[:house_number]}%")

    @address = Address.new(address_params)

    @addresses.each do |address|
      if address_exist?(address, @address) && current_user.present?
        @user = current_user
        @user.update(address_id: address.id)
        redirect_to(root_path, notice: "Added to address succesfully.")
        break
      elsif @address.save
        @user = current_user
        @user.update(address_id: @address.id)
        redirect_to(root_path, notice: "Address was succesfully added.")
        break
      else
        render :new, status: :unprocessable_entity
      end
    end
  end

  private

  def address_params
    params.require(:address).permit(:country, :city, :post_code, :street, :house_number)
  end

  def user_params
    params.require(:user).permit(:address_id)
  end

  def address_exist?(address1, address2)
    address1.country == address2.country &&
      address1.city == address2.city &&
      address1.post_code == address2.post_code &&
      address1.street == address2.street &&
      address1.house_number == address2.house_number
  end
end
