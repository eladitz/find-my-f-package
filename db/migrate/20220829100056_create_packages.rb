class CreatePackages < ActiveRecord::Migration[7.0]
  def change
    create_table :packages do |t|
      t.integer :user_owner_id
      t.integer :user_receiver_id
      t.integer :address_id

      t.timestamps
    end
  end
end
