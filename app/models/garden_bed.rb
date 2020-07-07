class GardenBed < ApplicationRecord
    belongs_to :user
    has_many :plantings
    has_many :plants, through: :plantings

    validates_presence_of :name, :area
    # :area >0
end
