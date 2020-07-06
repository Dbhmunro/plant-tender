class CreatePlantPairs < ActiveRecord::Migration[6.0]
  def change
    create_table :plant_pairs do |t|
      t.integer :plant_a_id
      t.integer :plant_b_id
      t.boolean :friend

      t.timestamps
    end
  end
end
