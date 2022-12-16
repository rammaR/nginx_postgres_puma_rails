class CreateTelevisions < ActiveRecord::Migration[5.1]
  def change
    create_table :televisions do |t|
      t.string :screen
      t.integer :type
      t.decimal :price

      t.timestamps
    end
  end
end
