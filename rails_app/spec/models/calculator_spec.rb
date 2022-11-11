require 'rails_helper'

RSpec.describe Calculator, type: :model do
  
  subject(:calc) { Calculator.new() }

  context '#sum' do
  
    it 'with positive numbers' do
      result = calc.sum(5, 7)
      expect(result).to eq(12)
    end

    it 'with negative numbers' do
      result = calc.sum(5, -6)
      expect(result).to eq(-1)      
    end

    xit 'to be done' do
    end
  end
end