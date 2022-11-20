class CreatePublications < ActiveRecord::Migration[5.1]
  def change
    create_table :publications do |t|
      t.integer :status, :integer, default: 0

      t.timestamps
    end
  end
end
