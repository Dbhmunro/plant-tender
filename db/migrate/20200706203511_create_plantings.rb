class CreatePlantings < ActiveRecord::Migration[6.0]
  def change
    create_table :plantings do |t|
      t.integer :garden_bed_id
      t.integer :plant_id
      t.integer :plant_count

      t.timestamps
    end
  end
end
