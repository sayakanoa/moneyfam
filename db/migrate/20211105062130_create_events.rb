class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|

      t.integer :user_id
      t.string :title, null: false, default: ""
      t.string :body
      t.date :start_time

      t.timestamps
    end
  end
end
