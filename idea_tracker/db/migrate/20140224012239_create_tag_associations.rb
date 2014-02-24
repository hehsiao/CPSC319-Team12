class CreateTagAssociations < ActiveRecord::Migration
  def change
    create_table :tag_associations do |t|

      t.timestamps
    end
  end
end
