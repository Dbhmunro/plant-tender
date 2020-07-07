class AddPlantCountToGardenBedsPlants < ActiveRecord::Migration[6.0]
  def change
    add_column :plantings, :plant_count, :integer
  end
end
