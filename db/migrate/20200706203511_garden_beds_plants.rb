class GardenBedsPlants < ActiveRecord::Migration[6.0]
  def change
    create_table :garden_beds_plants, :id => false do |t|
      t.integer :garden_bed_id
      t.integer :plant_id
      t.integer :plant_count
    end
  end
end
