class ChangePlantCountInPlantings < ActiveRecord::Migration[6.0]
  def change
    change_column_default(:plantings, :plant_count, 1)
  end
end
