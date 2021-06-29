# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'active_support/testing/time_helpers'
include ActiveSupport::Testing::TimeHelpers

user = User.create(email: "a@example.com", password: "password")

travel_to 2.day.ago do
  user.meals.create(meal_type: "dinner", calories: 1.1, fats: 10.1, proteins: 9.1, carbohydrates: 450.1)
  user.meals.create(meal_type: "lunch", calories: 1.1, fats: 10.1, proteins: 9.1, carbohydrates: 450.1)
end

travel_to 1.day.ago do
  user.meals.create(meal_type: "dinner", calories: 1.1, fats: 10.1, proteins: 9.1, carbohydrates: 450.1)
  user.meals.create(meal_type: "lunch", calories: 1.1, fats: 10.1, proteins: 9.1, carbohydrates: 450.1)
end

user.meals.create(meal_type: "dinner", calories: 1.1, fats: 10.1, proteins: 9.1, carbohydrates: 450.1)
user.meals.create(meal_type: "lunch", calories: 1.1, fats: 10.1, proteins: 9.1, carbohydrates: 450.1)
