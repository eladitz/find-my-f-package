class AddUserNameToPackages < ActiveRecord::Migration[7.0]
  def change
    rename_column :packages, :user_reciever_id, :user_receiver_id
  end
end
