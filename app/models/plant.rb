class Plant < ApplicationRecord
    has_many :garden_beds_plants
    has_many :garden_beds, through: :garden_beds_plants

    has_many :plant_pairs, foreign_key: :plant_a_id, dependent: :delete_all, inverse_of: :plant_a
    has_many :pairs, through: :plant_pairs, source: :plant_b, class_name: 'Plant'
end
