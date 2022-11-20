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
end
