class AddAddressToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :address, foreign_key: true, null: true
  end
end
