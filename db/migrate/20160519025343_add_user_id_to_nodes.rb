class AddUserIdToNodes < ActiveRecord::Migration
  def change
    add_column :nodes, :user_id, :integer, null: false
    add_index :nodes, :user_id
  end
end
