require 'rails_helper'

RSpec.describe Coin, type: :model do
  it 'has to have a description' do
    coin = Coin.new
    coin.description = 'name'
    expect(coin.description).to eq('name')
  end
end
