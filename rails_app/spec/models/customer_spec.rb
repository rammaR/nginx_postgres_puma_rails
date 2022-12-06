require 'rails_helper'

RSpec.describe Customer, type: :model do
  context "is valid" do  
    it 'when has name, email and address' do
      attrs = attributes_for(:customer)
      customer = Customer.create(attrs)
      customer.valid?
      expect(customer.name).to start_with(/\w/)
      expect(customer).to be_valid
    end

    it 'email has to start with his name' do
      customer = build(:customer)
      expect(customer.email).to start_with(customer.name)
    end
  end

  context 'is invalid' do
    it 'when has no name' do
      customer = build(:customer, name: nil)
      customer.valid?
      expect(customer).not_to be_valid
      expect(customer.errors).to have_key(:name)
    end

    it 'when has no email' do
      customer = build(:customer, email: nil)
      customer.valid?
      expect(customer).not_to be_valid
      expect(customer.errors).to have_key(:email)
    end
  end
end
