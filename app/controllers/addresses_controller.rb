class AddressesController < ApplicationController
  def new
    @address = Address.new
  end

  def create
    @addresses = Address.find('country ILIKE ? AND city ILIKE ? AND post_code ILIKE ? AND street ILIKE ?
                                AND house_number ILIKE ?',
                                "%#{params[:country]}%",
                                "%#{params[:city]}%",
                                "%#{params[:post_code]}%",
                                "%#{params[:street]}%",
                                "%#{params[:house_number]}%")
    @address = Address.new(address_params)

    if @addresses.present?
      raise
    end
    if @address.save
      if current_user.present?
        @user = current_user
        @user.update(address_id: @address.id)
      end
      redirect_to(root_path, notice: "Address was succesfully added.")
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def address_params
    params.require(:address).permit(:country, :city, :post_code, :street, :house_number)
  end

  def user_params
    params.require(:user).permit(:address_id)
  end
end
