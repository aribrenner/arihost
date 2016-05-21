class MakeHitsPolymorphic < ActiveRecord::Migration
  def change
    add_column :hits, :hitable_type, :string
    rename_column :hits, :node_id, :hitable_id
  end
end
