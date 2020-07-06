class GardenBed < ApplicationRecord
    belongs_to :user
    has_many :garden_beds_plants
    has_many :plants, through: :garden_beds_plants

    validates_presence_of :name, :area
    # :area >0
end
