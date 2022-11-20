class CreateVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :votes do |t|
      t.integer :vote_type, :integer, default: 0

      t.timestamps
    end
  end
end
