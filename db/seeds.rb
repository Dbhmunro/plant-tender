# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Plant.create(name: 'Cabbage', scientific_name: 'Brassica oleracea', spread: 16, image_url: '')
Plant.create(name: 'Potato', scientific_name: 'Solanum tuberosum', spread: 12, image_url: '')
Plant.create(name: 'Basil', scientific_name: 'Ocimum basilicum', spread: 10, image_url: '')
Plant.create(name: 'Lettuce', scientific_name: 'Lactuca sativa', spread: 6, image_url: '')
Plant.create(name: 'Onion', scientific_name: 'Allium cepa', spread: 6, image_url: '')
Plant.create(name: 'Garlic', scientific_name: 'Allium sativum', spread: 4, image_url: '')
Plant.create(name: 'Carrot', scientific_name: 'Daucus carota', spread: 2, image_url: '')
Plant.create(name: 'Tomato', scientific_name: 'Solanum lycopersicum', spread: 24, image_url: '')
Plant.create(name: 'Cauliflower', scientific_name: 'Brassica oleracea', spread: 20, image_url: '')
Plant.create(name: 'Beans, Pole', scientific_name: 'Phaseolus vulgaris', spread: 5, image_url: '')
Plant.create(name: 'Beans, Bush', scientific_name: 'Phaseolus vulgaris', spread: 3, image_url: '')

Plant.find_by(name: "Carrot").pairs << Plant.find_by(name: "Tomato")
PlantPair.last.update(friend: true)
Plant.find_by(name: "Tomato").pairs << Plant.find_by(name: "Carrot")
PlantPair.last.update(friend: true)
Plant.find_by(name: "Cauliflower").pairs << Plant.find_by(name: "Onion")
PlantPair.last.update(friend: true)
Plant.find_by(name: "Onion").pairs << Plant.find_by(name: "Cauliflower")
PlantPair.last.update(friend: true)
Plant.find_by(name: "Basil").pairs << Plant.find_by(name: "Tomato")
PlantPair.last.update(friend: true)
Plant.find_by(name: "Tomato").pairs << Plant.find_by(name: "Basil")
PlantPair.last.update(friend: true)
Plant.find_by(name: "Onion").pairs << Plant.find_by(name: "Tomato")
PlantPair.last.update(friend: true)
Plant.find_by(name: "Tomato").pairs << Plant.find_by(name: "Onion")
PlantPair.last.update(friend: true)
Plant.find_by(name: "Onion").pairs << Plant.find_by(name: "Beans, Pole")
PlantPair.last.update(friend: false)
Plant.find_by(name: "Beans, Pole").pairs << Plant.find_by(name: "Onion")
PlantPair.last.update(friend: false)
Plant.find_by(name: "Onion").pairs << Plant.find_by(name: "Beans, Bush")
PlantPair.last.update(friend: false)
Plant.find_by(name: "Beans, Bush").pairs << Plant.find_by(name: "Onion")
PlantPair.last.update(friend: false)
Plant.find_by(name: "Potato").pairs << Plant.find_by(name: "Tomato")
PlantPair.last.update(friend: false)
Plant.find_by(name: "Tomato").pairs << Plant.find_by(name: "Potato")
PlantPair.last.update(friend: false)
Plant.find_by(name: "Cabbage").pairs << Plant.find_by(name: "Tomato")
PlantPair.last.update(friend: false)
Plant.find_by(name: "Tomato").pairs << Plant.find_by(name: "Cabbage")
PlantPair.last.update(friend: false)
# Carrot - Tomato true
# Onion - Cauliflower true
# Basil - Tomato true
# Onion - Tomato true
# Onion - Beans (both) false
# Potato - Tomato false
# Cabbage - Tomato false
