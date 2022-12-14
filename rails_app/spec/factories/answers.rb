FactoryBot.define do
  
  factory :answer do
    description { Faker::Lorem.paragraph(sentence_count: 2) }
    question
    correct { Faker::Boolean.boolean }

    trait :false_answer do
      correct { false }  
    end

    trait :truty_answer do
      correct { true }
    end

    trait :no_description do
      description nil
    end
  end

end