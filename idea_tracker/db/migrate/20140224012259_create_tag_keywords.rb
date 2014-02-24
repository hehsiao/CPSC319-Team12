class CreateTagKeywords < ActiveRecord::Migration
  def change
    create_table :tag_keywords do |t|

      t.timestamps
    end
  end
end
