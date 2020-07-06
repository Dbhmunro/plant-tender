class CreateGardenBeds < ActiveRecord::Migration[6.0]
  def change
    create_table :garden_beds do |t|
      t.string :name
      t.integer :area
      t.integer :user_id

      t.timestamps
    end
  end
end
