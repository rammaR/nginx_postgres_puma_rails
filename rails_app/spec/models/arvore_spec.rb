require 'rails_helper'

RSpec::Matchers.define_negated_matcher :not_have_attibutes, :have_attributes

describe Arvore , type: :model do

  context "quando ainda pequena" do

    it "deve ter raizes fortes" do
        raiz_grau_resistencia = 10
      expect(raiz_grau_resistencia).to eq(10)
    end

    it "não pode ter mais de 5 anos" do
        age = 5
        expect(age).to eq(5)
    end   

    it "não pode dar frutos ainda" do
        has_fruits = 0
        expect(has_fruits).not_to eq(1)
    end
    
  end

  context 'testando atributos da arvore' do

    it 'arvore com 400 anos e nome eucalito' do
       subject.age = "400"
       expect(subject).to have_attributes(age: "400") 
       subject.name = "Eucalipto"
       expect(subject).to have_attributes(name: "Eucalipto")
    end    

    it 'Tree cannot be more than 10000 years old' do
      subject.age = "1000"
      expect(subject).to not_have_attibutes(age: "100000")
    end

  end

end
