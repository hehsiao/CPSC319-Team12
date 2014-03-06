class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :idea_id
      t.text :comment
      t.integer :user_id
      t.date :comment_date

      t.timestamps
    end
  end
end
