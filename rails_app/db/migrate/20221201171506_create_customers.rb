class CreateCustomers < ActiveRecord::Migration[5.1]
  def change
    #drop_table :customers

    create_table :customers do |t|
      t.string :name
      t.string :email
      t.string :address

      t.timestamps
    end
  end
end
