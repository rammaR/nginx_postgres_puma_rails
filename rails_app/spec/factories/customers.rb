FactoryBot.define do
  
  factory :customer do
    name { Faker::Name.name }
    email { name + "@mail" if name }
    address { Faker::Address.street_address }
    # atributo transiente
    transient do
      qtt_orders 10
    end

    # trait
    trait :with_orders do
      # callback
      after(:create) do |customer, evaluator|
        # create list
        create_list(:order, evaluator.qtt_orders, customer: customer)
      end
    end
  end
  
end
