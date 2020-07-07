class CreateGardenBedsPlantsJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_join_table :garden_beds, :plants, table_name: :plantings
  end
end
