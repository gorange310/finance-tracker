# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(email: Faker::Internet.email, first_name: "Robot1", last_name: "YO",password: "password")
User.create(email: Faker::Internet.email, first_name: "Robot2", last_name: "YO",password: "password")
User.create(email: Faker::Internet.email, first_name: "Robot3", last_name: "YO",password: "password")
User.create(email: Faker::Internet.email, first_name: "Robot4", last_name: "YO",password: "password")
User.create(email: Faker::Internet.email, first_name: "Robot5", last_name: "YO",password: "password")
User.create(email: Faker::Internet.email, first_name: "Robot6", last_name: "YO",password: "password")