require 'faker'


puts " creating 10 users..."
10.times do |n|
  user = User.new(
     first_name: Faker::Name.first_name,
     last_name: Faker::Name.last_name,
     bio: Faker::Superhero.descriptor,
     email: "user#{n}@user.com",
     password: 123456,
     location: Faker::Nation.capital_city
  )
  user.save!
end
puts 'finished!'

users = User.all
puts " creating 10 faker listings..."
10.times do
  listing = Listing.new(
    image: Faker::LoremFlickr.image(size: "50x60", search_terms: ['beer', 'beerpong']),
    title: "#{Faker::WorldCup.stadium} - beerpong table",
    description: Faker::Beer.style,
    price: "#{Faker::Number.decimal(l_digits: 2)}$",
    rating: [1..5].sample,
    user: users.sample
  )
  listing.save!
end
puts 'finished'





# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
