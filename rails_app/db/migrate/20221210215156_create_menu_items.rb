class CreateMenuItems < ActiveRecord::Migration[5.1]
  def change
    create_table :menu_items do |t|
      t.string :description
      t.references :menu_category, foreign_key: true

      t.timestamps
    end
  end
end
