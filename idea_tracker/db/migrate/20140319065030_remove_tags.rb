class RemoveTags < ActiveRecord::Migration
  def up
  	drop_table :tags
  end

  def down
    create_table :tags, :id => false do |t|
      t.integer :category_id
      t.integer :idea_id
      t.string :additional_text

      t.timestamps
    end
  end
end
