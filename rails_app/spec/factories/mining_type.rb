FactoryBot.define do
    factory :mining_type do
        name { Faker::Name.name }
        acronym { Faker::Internet.password(min_length: 3, max_length: 3) }
    end
end