class AddColumnsToCustomer < ActiveRecord::Migration[5.1]
  def change
    add_column :customers, :phone, :string
    add_column :customers, :avatar, :string
    add_column :customers, :smoking, :boolean
  end
end
