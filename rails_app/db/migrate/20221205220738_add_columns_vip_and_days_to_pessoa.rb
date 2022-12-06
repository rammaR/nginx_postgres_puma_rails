class AddColumnsVipAndDaysToPessoa < ActiveRecord::Migration[5.1]
  def change
    add_column :pessoas, :vip, :boolean
    add_column :pessoas, :days_to_pay, :integer
  end
end
