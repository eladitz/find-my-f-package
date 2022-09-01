class ChangePackagesFieldName < ActiveRecord::Migration[7.0]
  def change
    add_column :packages, :not_register_user_name, :string
  end
end
