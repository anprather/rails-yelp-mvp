require 'faker'

puts 'Cleaning database...'
Restaurant.destroy_all

puts 'Creating restaurants...'

5.times do
  restaurant = Restaurant.new(
    name: Faker::Restaurant.name,
    address: Faker::Address.street_address,
    phone_number: Faker::PhoneNumber.phone_number_with_country_code,
    category: Restaurant::CATEGORY.sample
  )
  restaurant.save

  3.times do
    review = Review.new(
      content: Faker::Hipster.paragraph_by_chars(characters: 256, supplemental: false),
      rating: (0..5).to_a.sample,
      restaurant_id: restaurant.id
    )
    review.save
  end

  restaurant.save!
end
