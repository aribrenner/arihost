class CreateHits < ActiveRecord::Migration
  def change
    create_table :hits do |t|
      t.string :location
      t.string :ip
      t.string :device
      t.integer :node_id, null: false
    end

    add_index :hits, :ip
    add_index :hits, :node_id
  end
end
