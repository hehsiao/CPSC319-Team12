class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.integer :idea_id
      t.integer :user_id
      t.boolean :is_active

      t.timestamps
    end
  end
end
