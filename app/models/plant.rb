class Plant < ApplicationRecord
    has_many :plantings
    has_many :garden_beds, through: :plantings

    has_many :plant_pairs, foreign_key: :plant_a_id, class_name: "PlantPair", dependent: :delete_all, inverse_of: :plant_a
    has_many :pairs, through: :plant_pairs, source: :plant_b, class_name: 'Plant'
end
