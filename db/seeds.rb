5.times do
    Guide.create(
        name: Faker::Name.name,
        phone: Faker::PhoneNumber.phone_number,
        email: Faker::Internet.email
    	)
end
puts "Loaded Guides!!!!"

10.times do
	Tourist.create(
        name: Faker::Name.name,
        email: Faker::Internet.email
    	)
end
puts "Loaded Turist!!!!"

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

5.times do
	Excursion.create(
        name: Faker::Name.name,
        duration: Faker::Number.between(1, 4),
        price: Faker::Commerce.price, 
        start: Faker::Date.forward(15),
        description: Faker::Lorem.paragraph,
        monuments: Monument.offset(rand(1..10))
    	)
end
puts "Loaded Excursions!!!!"

10.times do
    Offer.create(
        excursion_id: Faker::Number.between(1, 5),
        guide_id: Faker::Number.between(1, 10),
        language: Faker::Address.country_code,
        date: Faker::Date.forward(15),
        available: Faker::Number.between(1, 25)
        )
end
puts "Loaded Offers!!!!"

10.times do
    Tour.create(
        excursion_id: Faker::Number.between(1, 5),
        guide_id: Faker::Number.between(1, 10),
        tourist_id: Faker::Number.between(1, 10),
        guide_point: Faker::Number.between(1, 5),
        excursion_point: Faker::Number.between(1, 5),
        guide_description: Faker::Lorem.paragraph,
        excursion_description: Faker::Lorem.paragraph 
        )
end
puts "Loaded Tours!!!!"