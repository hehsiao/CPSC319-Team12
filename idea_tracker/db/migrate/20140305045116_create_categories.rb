class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.integer :parent_id
      t.string :category_name
      t.integer :type_id

      t.timestamps
    end
  end
end
