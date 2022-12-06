require 'rails_helper'

RSpec.describe Order, type: :model do
  it 'has to have a customer references' do
    order = create(:order)
    #puts order.description
    #puts order.customer.name
    expect(order.customer).to be_kind_of(Customer)
  end

  it 'Tem 3 pedidos' do
    orders = create_list(:order, 3)
    expect(orders.count).to eq(3)
  end

  it 'has_many customers' do
    customer = create(:customer, :with_orders, qtt_orders: 3)
    expect(customer.orders.count).to eq(3)
  end
end
