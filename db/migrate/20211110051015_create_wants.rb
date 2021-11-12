class CreateWants < ActiveRecord::Migration[5.2]
  def change
    create_table :wants do |t|
      t.references :user, foreign_key: true
      t.string :name, null: false
      t.integer :price, null: false
      t.date :month, null: false
      t.integer :priority, null: false
      t.date :limit_date, null: false
      t.timestamps
    end
  end
end
