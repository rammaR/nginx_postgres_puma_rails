require 'rails_helper'

RSpec.describe Category, type: :model do
  
  subject { build(:category) } 
  
  # Quando instanciado com atributos válidos, o model deve ser válido
  context 'is valid' do
    it 'with description' do
      subject.valid?

      expect(subject).to be_valid
      expect(subject.description.size).to be >= 1
    end
  end

  # Validações devem ser testadas
  context 'Is invalid' do
    it 'without description' do
      subject.description = nil

      subject.valid?

      expect(subject).not_to be_valid
      expect(subject.errors).to have_key(:description)
    end
  end

  # Métodos de classe e instância devem executar corretamente
  context 'Should' do
    
  end
  
end
