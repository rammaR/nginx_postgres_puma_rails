FactoryBot.define do
  
  factory :order do
    sequence(:description) {|n| "Pedido #{n}"}
    customer
  end

end