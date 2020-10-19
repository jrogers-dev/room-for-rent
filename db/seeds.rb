# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(name: "Bob", email: "Bob@bob.net", password_digest: "bobgeorgegeorgebob")
User.create(name: "William Jehosaphat Vinovich, Third of his Name", email: "WJV3@gmail.com", password_digest: "password")

Property.create(landlord_id: 1, tenant_id: 2)