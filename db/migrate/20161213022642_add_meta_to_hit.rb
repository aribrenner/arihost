class AddMetaToHit < ActiveRecord::Migration
  def change
    add_column :hits, :meta, :string
  end
end
