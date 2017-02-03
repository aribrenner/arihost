class RemoveNodeUserIdNullConstraint < ActiveRecord::Migration
  def change
    change_column :nodes, :user_id, :integer, null: true
  end
end
