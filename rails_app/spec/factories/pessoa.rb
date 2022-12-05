FactoryBot.define do
    factory :pessoa do

        name Faker::Name.name
        age  Faker::Number.within(range: 1..100)

        factory :pessoa_male do
            genre 'M'
        end

        factory :pessoa_female do
            genre 'F'
        end

    end
end