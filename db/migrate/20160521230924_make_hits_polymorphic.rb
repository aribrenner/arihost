class MakeHitsPolymorphic < ActiveRecord::Migration
  def change
    add_column :hits, :hittable_type, :string
    rename_column :hits, :node_id, :hittable_id
  end
end
