class CreateArvores < ActiveRecord::Migration[5.1]
  def change
    create_table :arvores do |t|
      t.string :root_resistance
      t.string :name
      t.string :breed
      t.string :age
      t.string :type
      t.string :num_nodules
      t.string :has_flowers
      t.string :has_fruits

      t.timestamps
    end
  end
end
