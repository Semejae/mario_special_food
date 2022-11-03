# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Product.destroy_all
Review.destroy_all

5.times do |index|
    product = Product.create!(name: Faker::Food.vegetables,
                    cost: Faker::Number.within(range: 1..100),
                    country_of_origin: Faker::WorldCup.team)

5.times do |index2| 
        Review.create!(author: Faker::Name.name,
                    content_body: Faker::Lorem.sentence(word_count: 25),
                    rating: 5,
                    product_id: product.id)
  end
end