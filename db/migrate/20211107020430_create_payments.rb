class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.references :user, foreign_key: true
      t.date :month, null: false, default: ""
      t.integer :house
      t.integer :life
      t.integer :food
      t.integer :enjoy
      t.integer :saving
      t.integer :investing
      t.integer :other
      t.timestamps
    end
  end
end
