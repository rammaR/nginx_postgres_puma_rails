require 'rails_helper'

RSpec.describe Product, type: :model do
  
  subject { create(:product) } 

  context "Is valid " do
      
    it 'with description, price and category' do
        # product = create(:product)
        expect(subject).to  be_valid
    end
    
    it 'if category is valid too' do
      subject.category.valid?

      expect(subject.category).to be_valid
      expect(subject.category.errors.size).to be <= 0
      expect(subject.category).to be_instance_of(Category)
    end

  end
  
  context 'Is invalid ' do
    it 'without description' do
      subject.description = nil
      
      subject.valid?

      expect(subject).not_to be_valid
      expect(subject.errors).to have_key(:description)
    end

    it "without price" do
      subject.price = nil

      subject.valid?
      
      expect(subject).not_to be_valid
      expect(subject.errors).to have_key(:price)
    end

    it "without category" do
      subject.category = nil
      
      subject.valid?

      expect(subject).not_to be_valid
      expect(subject.errors).to have_key(:category)
    end
  end

  context "Should " do
    it "Return a product with full description" do
      subject.description = "Product Name"
      subject.price = 9.99
      
      description = subject.full_description

      expect(description).to eq("Product Name by 9.99")
    end
  end

end
