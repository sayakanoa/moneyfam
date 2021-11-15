class CreatePostComments < ActiveRecord::Migration[5.2]
  def change
    create_table :post_comments do |t|
      t.references :user, foreign_key: true
      t.references :event, foreign_key: true
      t.text :comment
      t.timestamps
    end
  end
end
