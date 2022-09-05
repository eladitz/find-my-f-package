class AddingCommentToPackage < ActiveRecord::Migration[7.0]
  def change
    add_column :packages, :comment, :string, null: true
  end
end
