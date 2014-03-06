class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.integer :user_id
      t.text :notification_text
      t.boolean :has_checked

      t.timestamps
    end
  end
end
