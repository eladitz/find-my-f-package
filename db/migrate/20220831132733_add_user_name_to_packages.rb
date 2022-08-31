class AddUserNameToPackages < ActiveRecord::Migration[7.0]
  def change
    ## name switched with add user name and change package field
    rename_column :packages, :user_reciever_id, :user_receiver_id
  end
end
