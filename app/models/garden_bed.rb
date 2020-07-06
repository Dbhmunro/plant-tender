class GardenBed < ApplicationRecord
    belongs_to :user
    has_many :garden_bed_plants
    has_many :plants, through: :garden_bed_plants

    validates_presence_of :name, :area
    # :area >0
end
