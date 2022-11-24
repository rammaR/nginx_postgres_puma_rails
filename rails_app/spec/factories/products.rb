FactoryBot.define do
  factory :product do
    description Faker::Commerce.product_name
    price Faker::Commerce.price
    created_at Faker::Date.backward(days: 14)
    updated_at Faker::Date.backward(days: 13)
    category
  end
end
