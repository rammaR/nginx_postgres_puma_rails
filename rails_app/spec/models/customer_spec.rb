require 'rails_helper'

RSpec.describe Customer, type: :model do
  it 'is valid' do
    attrs = attributes_for(:customer)
    customer = Customer.create(attrs)
    customer.valid?
    expect(customer.name).to start_with(/\w/)
    expect(customer).to be_valid
  end
end
