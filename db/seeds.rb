# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# require "faker"

10.times do 
    User.create(
        name: Faker::Name.name, 
        email: Faker::Internet.email, 
        password: "password",
        password_confirmation: "password"
    )
end

5.times do 
    Property.create(
        landlord_id: Faker::Number.unique.between(from: 1, to: 10),
        tenant_id: Faker::Number.unique.between(from: 1, to: 10),
        address: Faker::Address.street_address,
        rooms: Faker::Number.between(from: 1, to: 3),
        bathrooms: Faker::Number.between(from: 1, to: 3),
        squarefeet: Faker::Number.between(from: 1000, to: 2500),
        storeys: Faker::Number.between(from: 1, to: 3),
        rent: Faker::Number.between(from: 2000, to: 4000),
        available: true
    )
end