FactoryBot.define do
  factory :user, aliases: [:customer] do
    name Faker::Name.name
    lastname Faker::Name.name
    email Faker::Internet.email

    factory :admin do
      name 'Admin'
    end
  end
end
