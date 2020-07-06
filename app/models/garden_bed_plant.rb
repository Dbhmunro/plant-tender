class GardenBedPlant < ApplicationRecord
    belongs_to :garden_bed
    belongs_to :plant
end