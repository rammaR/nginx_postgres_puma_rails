class AddMiningTypeRefToCoins < ActiveRecord::Migration[5.1]
  def change
    add_reference :coins, :mining_type, foreign_key: true
  end
end
