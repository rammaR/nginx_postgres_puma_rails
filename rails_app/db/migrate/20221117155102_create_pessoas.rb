class CreatePessoas < ActiveRecord::Migration[5.1]
  def change
    create_table :pessoas do |t|
      t.string :name
      t.string :age
      t.string :genre
      t.string :birthday

      t.timestamps
    end
  end
end
