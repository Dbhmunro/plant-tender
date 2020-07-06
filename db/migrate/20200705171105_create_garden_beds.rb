class CreateGardenBeds < ActiveRecord::Migration[6.0]
  def change
    create_table :garden_beds do |t|
      t.string :name
      t.decimal :area, :precision => 2
      t.integer :user_id

      t.timestamps
    end
  end
end
