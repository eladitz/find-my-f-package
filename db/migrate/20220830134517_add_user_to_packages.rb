class AddUserToPackages < ActiveRecord::Migration[7.0]
  def change
    remove_column :packages, :address_id
    add_reference :packages, :address, foreign_key: true, null: false
  end
end
