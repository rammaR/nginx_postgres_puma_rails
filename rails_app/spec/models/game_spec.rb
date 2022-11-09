require 'rails_helper'

RSpec.describe Game, type: :model do
  it 'returns 0 for an all gutter game' do
    game = Game.new
    game.score = 0
    expect(game.score).to eq(0)
  end
  
end
