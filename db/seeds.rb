# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "SEED : Clean DB"
Restaurant.destroy_all
Review.destroy_all
puts "SEED : Start populate"
10.times do
  restaurant = Restaurant.new(
    name: Faker::Restaurant.name,
    address: Faker::Address.city,
    phone_number: Faker::PhoneNumber.phone_number_with_country_code,
    category: Restaurant.getCategories.sample
  )
  if restaurant.save!
    (1..4).to_a.sample.times do
      review = Review.new(
        rating: (0..5).to_a.sample,
        content: Faker::Restaurant.review
      )
      review.restaurant = restaurant
      review.save!
    end
  end
end
puts "SEED : Pompulate done"
