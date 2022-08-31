class ChangePackagesFieldName < ActiveRecord::Migration[7.0]
  def change
    ## name switched with add user name and change package field
    add_column :packages, :not_register_user_name, :string
  end
end
