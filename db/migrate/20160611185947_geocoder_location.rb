class GeocoderLocation < ActiveRecord::Migration
  def change
    remove_column :hits, :location, :string

    change_table :hits do |t|
      t.string :latitude
      t.string :longitude
      t.string :city
    end
  end
end
