# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Plant.create(name: '', scientific_name: '', spread: , image_url: '')
Plant.create(name: 'Carrot', scientific_name: 'Daucus carota', spread: 2, image_url: '')
Plant.create(name: 'Tomato', scientific_name: 'Solanum lycopersicum', spread: 24, image_url: '')
Plant.create(name: 'Cauliflower', scientific_name: 'Brassica oleracea', spread: 20, image_url: '')
Plant.create(name: 'Beans, Pole', scientific_name: 'Phaseolus vulgaris', spread: 5, image_url: '')
Plant.create(name: 'Beans, Bush', scientific_name: 'Phaseolus vulgaris', spread: 3, image_url: '')

# Carrot - Tomato