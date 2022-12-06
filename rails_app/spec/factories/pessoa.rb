FactoryBot.define do
    factory :pessoa do

        name { Faker::Name.name }
        age  { Faker::Number.within(range: 1..100) }

        trait :male do
            genre 'M'
        end

        trait :female do
            genre 'F'
        end

        trait :vip do
            vip true
            days_to_pay 30
        end

        trait :default do
            vip false
            days_to_pay 15
        end

        factory :pessoa_male, traits: [:male]
        factory :pessoa_female, traits: [:female]
        factory :pessoa_vip, traits: [:vip]
        factory :pessoa_default, traits: [:default]
        factory :pessoa_male_vip, traits: [:male, :vip]
        factory :pessoa_female_vip, traits: [:female, :vip]
        factory :pessoa_male_default, traits: [:male, :default]
        factory :pessoa_female_default, traits: [:female, :default]
    end
end