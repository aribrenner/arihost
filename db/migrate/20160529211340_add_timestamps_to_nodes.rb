class AddTimestampsToNodes < ActiveRecord::Migration
  def change
    change_table :nodes do |t|
      t.timestamps null: false
    end
  end
end
