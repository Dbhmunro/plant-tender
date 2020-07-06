class Plant < ApplicationRecord
    has_many :garden_beds_plants
    has_many :garden_beds, through: :garden_beds_plants
end
