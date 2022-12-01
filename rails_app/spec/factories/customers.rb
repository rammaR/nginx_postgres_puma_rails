FactoryBot.define do
  factory :customer do
    name Faker::Name.name
    email Faker::Internet.email
    address Faker::Address.street_address
  end
end
