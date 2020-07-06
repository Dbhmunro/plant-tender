class User < ApplicationRecord
    has_many :garden_beds
    has_many :garden_beds_plants, through: :garden_beds
    has_many :plants, through: :garden_beds_plants

    validates_presence_of :name, :email
    validates :email, uniqueness: true

    has_secure_password
end
