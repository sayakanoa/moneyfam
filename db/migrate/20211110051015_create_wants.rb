class CreateWants < ActiveRecord::Migration[5.2]
  def change
    create_table :wants do |t|
      t.references :user, foreign_key: true
      t.date :month
      t.string :name, null: false
      t.integer :price, null: false
      t.boolean :have_state, default: false, null: false
      t.boolean :buy_state, default: false, null: false
      t.date :limit_date, null: false
      t.timestamps
    end
  end
end
