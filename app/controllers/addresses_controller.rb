class AddressesController < ApplicationController
  def new
    @address = Address.new
  end

  def create
    @addresses = Address.where('country ILIKE ? AND city ILIKE ?
      AND post_code ILIKE ? AND street ILIKE ?
      AND house_number ILIKE ?',
      "%#{params[:country]}%",
      "%#{params[:city]}%", "%#{params[:post_code]}%",
      "%#{params[:street]}%", "%#{params[:house_number]}%")
    @address = Address.new(address_params)
    @user = current_user
    add_existing_package_to_new_user(@user)
    if address_exist?(@address) && current_user.present?
      @user.update(address_id: @addresses[0].id)
      redirect_to(root_path, notice: "Added to address succesfully.")
    elsif @address.save
      @user.update(address_id: @address.id)
      redirect_to(root_path, notice: "Address was succesfully added.")
    else
      render :new, status: :unprocessable_entity
    end
  end

  def search_countries
    return @countries = Address.where("country ILIKE ?", "%#{params[:query]}%") if params[:query].present?
  end

  private

  def address_params
    params.require(:address).permit(:country, :city, :post_code, :street, :house_number)
  end

  def user_params
    params.require(:user).permit(:address_id)
  end

  def address_exist?(address1)
    if address1.country == @addresses[0].country && address1.city == @addresses[0].city &&
       address1.post_code == @addresses[0].post_code && address1.street == @addresses[0].street &&
       address1.house_number == @addresses[0].house_number
      return true
    else
      return false
    end
  end

  def add_existing_package_to_new_user(user)
    fullname = "#{user.first_name} #{user.last_name}"
    @packages = Package.where(["not_register_user_name = ?", fullname])
    unless @packages.size.zero?
      @packages.each do |package|
        package.update(user_owner_id: @user.id)
      end
    end
  end
end
