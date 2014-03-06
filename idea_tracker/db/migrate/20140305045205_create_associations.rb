class CreateAssociations < ActiveRecord::Migration
  def change
    create_table :associations, :id => false do |t|
      t.integer :parent_idea_id
      t.integer :tagged_idea_id
      t.boolean :is_hierarchy

      t.timestamps
    end
  end
end
