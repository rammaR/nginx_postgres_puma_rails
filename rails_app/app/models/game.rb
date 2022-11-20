class Game < ApplicationRecord

    enum genre: {action: 0, rpg: 1, platform: 2, horror: 3, race: 4, fight: 5, coop: 6}

    def roll(pins)
    end
  
    def score
      0
    end

end
