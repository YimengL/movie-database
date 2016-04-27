# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(name: "Yimeng Li",
             email: "example@example.com",
             password: "foobar",
             password_confirmation: "foobar", admin: true)
             
31.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password)
end

user = User.find_by admin: true
31.times do
  movie_name = Faker::Name.name
  content = Faker::Lorem.sentence(5)
  Movie.create!(name: movie_name, content: content, user_id: user.id)
end