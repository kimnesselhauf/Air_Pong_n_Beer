require 'faker'
Booking.destroy_all
User.destroy_all
Listing.destroy_all

puts " creating 3 users..."
3.times do |n|
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
puts " creating listings..."

listing = Listing.new(
  photo: open('app/assets/images/table1.jpeg'),
  title: "Le Classic",
  description: "The classic beer pong table. No fancy bells and whistles. Just you, beer, balls and a good time.",
  price: "40",
  rating: rand(1..5),
  user: users.sample
)
listing.save!

listing = Listing.new(
  photo: open('app/assets/images/table2.jpg'),
  title: "Beer De Americano",
  description: "Collapsible beer pong table, with a hint of patriotism. Americans ONLY",
  price: "160",
  rating: rand(1..5),
  user: users.sample
)
listing.save!

listing = Listing.new(
  photo: open('app/assets/images/table3.jpeg'),
  title: "Old School",
  description: "Plain, white foldable table to play beer pong on. Worked for centuries.",
  price: "5",
  rating: rand(1..5),
  user: users.sample
)
listing.save!

listing = Listing.new(
  photo: open('app/assets/images/table4.jpeg'),
  title: "Water Pong",
  description: "Why limit yourself to land? It's 2019.",
  price: "80",
  rating: rand(1..5),
  user: users.sample
)
listing.save!

listing = Listing.new(
  photo: open('app/assets/images/table5.jpeg'),
  title: "Handcrafted Mahogany Table",
  description: "One of a kind piece of art. Crafted with my own bare hands.",
  price: "500",
  rating: rand(1..5),
  user: users.sample
)
listing.save!

listing = Listing.new(
  photo: open('app/assets/images/table6.jpeg'),
  title: "Infintiy Pong",
  description: "100% legit. Ignore watermark.",
  price: "100",
  rating: rand(1..5),
  user: users.sample
)
listing.save!

listing = Listing.new(
  photo: open('app/assets/images/table7.jpeg'),
  title: "NBA Pong",
  description: "KOBEEEEE!! or Shaq? That is the question?",
  price: "60",
  rating: rand(1..5),
  user: users.sample
)
listing.save!

listing = Listing.new(
  photo: open('app/assets/images/table8.jpeg'),
  title: "Mini Beer Pong Table",
  description: "For when your really drunk, but don't wanna stop drinking.",
  price: "12",
  rating: rand(1..5),
  user: users.sample
)
listing.save!

listing = Listing.new(
  photo: open('app/assets/images/table9.jpeg'),
  title: "Glass Pong",
  description: "Transfer here => *************3636",
  price: "200",
  rating: rand(1..5),
  user: users.sample
)
listing.save!

puts 'finished'





# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
