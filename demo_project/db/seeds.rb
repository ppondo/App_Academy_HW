# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

my_house = House.create(address: "123 Street Ave.")
other_house = House.create(address: "333 Avenue St.")

p1 = Person.create(name: "Patrick", house_id: my_house.id)
p2 = Person.create(name: "Lisa", house_id: other_house.id)
