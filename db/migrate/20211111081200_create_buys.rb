class CreateBuys < ActiveRecord::Migration[5.2]
  def change
    create_table :buys do |t|
      t.references :user, foreign_key: true
      t.references :want, foreign_key: true
      t.date :month, null: false
      t.timestamps
    end
  end
end
