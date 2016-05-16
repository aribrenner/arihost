class CreateNodeTable < ActiveRecord::Migration
  def change
    create_table :nodes do |t|
      t.column :short_url, :string, null: false
      t.column :redirect_url, :string, null: false
    end

    add_index :nodes, :short_url, unique: true
  end
end
