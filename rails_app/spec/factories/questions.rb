FactoryBot.define do
  factory :question do
    description { Faker::Lorem.paragraph(sentence_count: 2) }
    subject

    trait :no_description do
      description nil
    end 

    trait :no_subject do
      subject nil
    end 
  end
end
