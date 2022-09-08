class AddressesController < ApplicationController
  def new
    @address = Address.new
  end

  def create
    # TODO - fix edge case issue when there is no addresses in database
    @address = Address.new(address_params)
    if address_exist?(@address) && current_user.present?
      @user = current_user
      @user.update(address_id: @address.id)
      redirect_to(root_path, notice: "Added to address succesfully.")
    elsif @address.save
      @user = current_user
      @user.update(address_id: @address.id)
      redirect_to(root_path, notice: "Address was succesfully added.")
    else
      render :new, status: :unprocessable_entity
    end
  end

  def search_countries
    if params[:query].present?
      @countries = Address.where("country ILIKE ?", "%#{params[:query]}%")
    end
  end

  private

  def address_params
    params.require(:address).permit(:country, :city, :post_code, :street, :house_number)
  end

  def user_params
    params.require(:user).permit(:address_id)
  end

  def address_exist?(address1)
    @addresses = Address.where('country ILIKE ? AND city ILIKE ?
      AND post_code ILIKE ? AND street ILIKE ?
      AND house_number ILIKE ?',
      "%#{params[:country]}%",
      "%#{params[:city]}%", "%#{params[:post_code]}%",
      "%#{params[:street]}%", "%#{params[:house_number]}%")
    @addresses.each do |address|
      if address1.country == address.country &&
        address1.city == address.city &&
        address1.post_code == address.post_code &&
        address1.street == address.street &&
        address1.house_number == address.house_number
        return true
      else
        return false
      end
    end
  end
end
