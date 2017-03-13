class FixHittableColumnName < ActiveRecord::Migration
  def change
    rename_column :hits, :hitable_id, :hittable_id
    rename_column :hits, :hitable_type, :hittable_type
  end
end
