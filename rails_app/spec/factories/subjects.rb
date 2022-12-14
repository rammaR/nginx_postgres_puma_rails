FactoryBot.define do
  factory :subject do
    description { Faker::Lorem.paragraph(sentence_count: 2) }

    trait :invalid_subject do
      description nil
    end
    
  end
end
