FactoryBot.define do
  factory :user do
    email    { "a@b.com" }
    password { "password" }
  end

  factory :meal do
    user

    fats          { 10.1 }
    calories      { 200.1 }
    proteins      { 11.2 }
    carbohydrates { 350.01 }
    meal_type     { "breakfast" }
  end
end
