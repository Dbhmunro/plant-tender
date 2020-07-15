class Planting < ApplicationRecord
    belongs_to :garden_bed
    belongs_to :plant

    # validates_presence_of :plant_count, :plant_id, :garden_bed_id
    validates_uniqueness_of :plant_id, scope: :garden_bed_id #only add plant once per garden
end