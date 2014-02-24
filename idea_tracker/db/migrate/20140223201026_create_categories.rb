class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
    	t.integer :idea_id
    	t.string :name
      t.timestamps
    end
    add_index("categories", "idea_id")
  end
end
