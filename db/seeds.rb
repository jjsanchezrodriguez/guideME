
#--------------------------------------------------------------------
Monument.create(  name: "Cibeles",description: Faker::Lorem.paragraph,
        image: "monuments/monument1.jpg",
        long: Faker::Address.longitude,lat: Faker::Address.latitude )

Monument.create( name: "Puerta del Sol",description: Faker::Lorem.paragraph,
        image: "monuments/monument2.jpg",
        long: Faker::Address.longitude,lat: Faker::Address.latitude )

Monument.create( name: "Palacio Real", description: Faker::Lorem.paragraph,
        image: "monuments/monument3.jpg",
        long: Faker::Address.longitude,lat: Faker::Address.latitude )

Monument.create( name: "Plaza Mayor", description: Faker::Lorem.paragraph,
        image: "monuments/monument4.jpg",
        long: Faker::Address.longitude,lat: Faker::Address.latitude )

Monument.create( name: "Gran Via", description: Faker::Lorem.paragraph,
        image: "monuments/monument5.jpg",
        long: Faker::Address.longitude,lat: Faker::Address.latitude )

Monument.create( name: "Puerta de Alcala",description: Faker::Lorem.paragraph,
        image: "monuments/monument6.jpg",
        long: Faker::Address.longitude,lat: Faker::Address.latitude )

Monument.create( name: "Metro Gran Via",description: Faker::Lorem.paragraph,
        image: "monuments/monument7.jpg",
        long: Faker::Address.longitude,lat: Faker::Address.latitude )

Monument.create( name: "Metro Sol",description: Faker::Lorem.paragraph,
        image: "monuments/monument8.jpg",
        long: Faker::Address.longitude,lat: Faker::Address.latitude )

Monument.create( name: "Oso y el Madroño",description: Faker::Lorem.paragraph,
        image: "monuments/monument9.jpg",
        long: Faker::Address.longitude,lat: Faker::Address.latitude )

Monument.create( name: "Ayuntamiento",description: Faker::Lorem.paragraph,
        image: "monuments/monument10.jpg",
        long: Faker::Address.longitude,lat: Faker::Address.latitude )

#--------------------------------------------------------------------------
puts "Loaded Monuments!!!!"

10.times do
	Excursion.create(
        name: Faker::Name.name,
        duration: Faker::Number.between(1, 4),
        price: Faker::Commerce.price, 
        description: Faker::Lorem.paragraph,
        monuments: Monument.offset(rand(1..5))
    	)
end
puts "Loaded Excursions!!!!"

10.times do
    Offer.create(
        excursion_id: Faker::Number.between(1, 5),
        user_id: Faker::Number.between(1, 5),
        language: Faker::Address.country_code,
        date: Faker::Date.forward(15),
        available: Faker::Number.between(1, 25)
        )
end
puts "Loaded Offers!!!!"

10.times do
    Tour.create(
        excursion_id: Faker::Number.between(1, 5),
        guide_id: Faker::Number.between(1, 5),
        tourist_id: Faker::Number.between(1, 5),
        guide_point: Faker::Number.between(1, 5),
        excursion_point: Faker::Number.between(1, 5),
        guide_description: Faker::Lorem.paragraph,
        excursion_description: Faker::Lorem.paragraph 
        )
end
puts "Loaded Tours!!!!"