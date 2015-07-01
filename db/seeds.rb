# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts "Creating photos..."

Photo.delete_all

Photo.create!({public: true, caption: "wat", image: "http://i.imgur.com/GwQQoqI.jpg", user_id: 1})
Photo.create!({public: false, caption: "65wat", image: "http://i.imgur.com/S0KosHO.jpg", user_id: 1})