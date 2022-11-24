require 'rails_helper'

RSpec.describe Coin, type: :model do
  it 'Coin has to have a name' do
    coin = Coin.new
    coin.name = 'name'
    expect(coin.name).to  eq('name')
  end
end
