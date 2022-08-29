class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :country
      t.string :city
      t.string :post_code
      t.string :street
      t.string :house_number
      t.integer :user_id

      t.timestamps
    end
  end
end
