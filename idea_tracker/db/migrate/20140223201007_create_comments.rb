class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :idea_id
   	  t.integer :user_id
      t.string :message	
      t.timestamps
    end
    add_index("comments", "idea_id")
  end
end
