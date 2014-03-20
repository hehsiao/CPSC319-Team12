class AddIdeaTags < ActiveRecord::Migration
  def change
    create_table :idea_tags, :id => false do |t|
      t.integer :category_id
      t.integer :idea_id
      t.string :additional_text

      t.timestamps
    end
  end
end
