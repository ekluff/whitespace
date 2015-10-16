class CreateExifs < ActiveRecord::Migration
  def change
    create_table :exifs do |t|
      t.string :camera
      t.string :software
      t.integer :iso
      t.string :shutter
      t.string :aperture
      t.datetime :taken
      t.string :exposure_bias
      t.boolean :flash
      t.string :focal_length
      t.references :image, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :exifs, :camera
    add_index :exifs, :software
    add_index :exifs, :iso
    add_index :exifs, :shutter
    add_index :exifs, :aperture
    add_index :exifs, :taken
    add_index :exifs, :exposure_bias
    add_index :exifs, :flash
    add_index :exifs, :focal_length
  end
end
