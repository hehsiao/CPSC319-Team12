class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
    	t.integer :client_id
    	t.integer :user_id
    	t.integer :comment_id
    	t.integer :category_id  
    	t.integer :tag_association_id
    	t.integer :tag_subscription_id
    	t.integer :tag_keyword_id

    	t.string :title
    	t.string :details
    	t.string :reference_source
    	t.string :status
			t.string :taker_name
    	t.string :taker_email
    	t.integer :taker_phone_num
      t.timestamps
    end
    add_index("ideas", "client_id")
    add_index("ideas", "user_id")
    add_index("ideas", "comment_id")
    add_index("ideas", "category_id")
    add_index("ideas", "tag_association_id")
    add_index("ideas", "tag_subscription_id")
    add_index("ideas", "tag_keyword_id")
  end
end
