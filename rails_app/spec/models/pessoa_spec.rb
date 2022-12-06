require 'rails_helper'

RSpec.describe Pessoa, type: :model do
  
  let (:pessoa) { Pessoa.new }

  it 'have name starting with w' do
    pessoa.name = 'Wendell'
    expect(pessoa).to have_attributes(name: a_string_starting_with('W'))
  end

  it 'Pessoa feliz!' do
    pessoa.feliz!
    expect(pessoa.status).to eq('Sentindo-se feliz!')
  end

  it 'Pessoa triste' do
    pessoa.triste!
    expect(pessoa.status).to eq('Sentindo-se triste!')
  end

  it 'De luto' do
    pessoa.luto!
    expect(pessoa.status).to eq('luto!')
  end

  context "pessoa male" do
    it 'is valid when genre is M' do
      pessoa = build(:pessoa_male)
      expect(pessoa.genre).to eq('M')
    end

    it 'and vip' do
      pessoa = build(:pessoa_male_vip)
      expect(pessoa.genre).to eq('M')
      expect(pessoa.vip).to be_truthy
      expect(pessoa.days_to_pay).to eq(30)
    end

    it 'and default' do
      pessoa = build(:pessoa_male_default)
      expect(pessoa.genre).to eq('M')
      expect(pessoa.vip).to be_falsy
      expect(pessoa.days_to_pay).to eq(15)
    end
  end

  context 'pessoa female' do
    it 'is valid when genre is F' do
      pessoa = build(:pessoa_female)
      expect(pessoa.genre).to eq('F')
    end

    it 'and vip' do
      pessoa = build(:pessoa_female_vip)
      expect(pessoa.genre).to eq('F')
      expect(pessoa.vip).to be_truthy
      expect(pessoa.days_to_pay).to eq(30)
    end

    it 'and default' do
      pessoa = build(:pessoa_female_default)
      expect(pessoa.genre).to eq('F')
      expect(pessoa.vip).to be_falsy
      expect(pessoa.days_to_pay).to eq(15)
    end
  end
end
