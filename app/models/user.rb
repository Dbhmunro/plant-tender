class User < ApplicationRecord
    has_many :garden_beds
    has_many :plantings, through: :garden_beds
    has_many :plants, through: :plantings
    
    has_many :favorite_plants
    has_many :fav_plants, through: :favorite_plants, source: :plant

    validates_presence_of :name, :email
    validates :email, uniqueness: true

    has_secure_password

    def garden_beds_without_plant(plant)
        beds = []
        self.garden_beds.each do |bed|
            if !bed.plants.include?(plant)
                beds << bed
            end
        end
        beds
    end

    def garden_beds_with_plant(plant)
        beds = []
        self.garden_beds.each do |bed|
            if bed.plants.include?(plant)
                beds << bed
            end
        end
        beds
    end

end
