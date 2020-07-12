class User < ApplicationRecord
    has_many :garden_beds
    has_many :plantings, through: :garden_beds
    has_many :plants, through: :plantings
    has_many :favorite_plants
    has_many :fav_plants, through: :favorite_plants, source: :plant

    validates_presence_of :name, :email
    validates :email, uniqueness: true

    has_secure_password
end
