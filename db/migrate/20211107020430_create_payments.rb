class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.references :user, foreign_key: true
      t.date :month, null: false
      t.integer :house, null: false
      t.integer :life, null: false
      t.integer :food, null: false
      t.integer :enjoy, null: false
      t.integer :saving, null: false
      t.integer :investing, null: false
      t.integer :other, null: false
      t.timestamps
    end
  end
end
