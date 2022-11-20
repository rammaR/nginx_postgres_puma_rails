class AddGenreTypeToGame < ActiveRecord::Migration[5.1]
  def change
    add_column :games, :genre, :integer, default: 0
  end
end
