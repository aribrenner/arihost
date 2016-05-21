class CreatePixels < ActiveRecord::Migration
  def change
    create_table :pixels do |t|
      t.string :short_url, null: false
      t.integer :user_id, null: false
      t.string :name
      t.text :description

      t.timestamps null: false
    end

    add_index :pixels, :short_url, unique: true
    add_index :pixels, :user_id
  end
end
