# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

5.times do
    Guide.create(
        name: Faker::Name.name,
        phone: Faker::PhoneNumber.phone_number,
        email: Faker::Internet.email
    	)
end
puts "Loaded Guides!!!!"

10.times do
	Turist.create(
        name: Faker::Name.name,
        email: Faker::Internet.email
    	)
end
puts "Loaded Turist!!!!"


5.times do
	Excursion.create(
        name: Faker::Name.name,
        duration: Faker::Number.between(1, 4),
        price: Faker::Commerce.price,
        start: Faker::Time.forward(15, :morning),
        description: Faker::Lorem.paragraph 
    	)
end
puts "Loaded Excursions!!!!"

10.times do
    Monument.create(
        name: Faker::Name.name,
        description: Faker::Lorem.paragraph,
        image: Faker::Avatar.image("my-own-slug", "50x50", "jpg"),
        long: Faker::Address.longitude,
        lat: Faker::Address.latitude  
        )
end
puts "Loaded Monuments!!!!"

10.times do
    Offer.create(
        excurion_id: Faker::Number.between(1, 5),
        guide_id: Faker::Number.between(1, 10),
        language: Faker::Address.country_code,
        date: Faker::Date.forward(15),
        available: Faker::Number.between(1, 25)
        )
end
puts "Loaded Offers!!!!"

10.times do
    Tour.create(
        excurion_id: Faker::Number.between(1, 5),
        guide_id: Faker::Number.between(1, 10),
        turist_id: Faker::Number.between(1, 10),
        guide_point: Faker::Number.between(1, 5),
        excursion_point: Faker::Number.between(1, 5),
        guide_description: Faker::Lorem.paragraph,
        excursion_description: Faker::Lorem.paragraph 
        )
end
puts "Loaded Tours!!!!"



# 10.times do
#     Monument_excursion.create(
#         monument_id: Faker::Number.between(1, 10),
#         excursion_id: Faker::Number.between(1, 5)
#         )
# end
# puts "Loaded Monuments!!!!"


