class PlantPair < ApplicationRecord
    belongs_to :plant_a, class_name: :Plant
    belongs_to :plant_b, class_name: :Plant
end
