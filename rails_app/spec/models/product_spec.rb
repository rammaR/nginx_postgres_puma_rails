require 'rails_helper'

RSpec.describe Product, type: :model do
  
  
  it 'is valid with description, price and category' do
    cat = Category.new
    product = Product.new(description: 'desc', price: 10.15, category: cat)

    expect(product).to  have_attributes(description: 'desc')
  end 

  it 'is invalid without description' do
  end

  it "is invalid without price" do
  end

  it "is invalid without category" do
  end

  it "return a product with full description" do
  end

end
