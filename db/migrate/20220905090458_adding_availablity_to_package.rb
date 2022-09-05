class AddingAvailablityToPackage < ActiveRecord::Migration[7.0]
  def change
    add_column :packages, :availability, :string, null: true
  end
end
