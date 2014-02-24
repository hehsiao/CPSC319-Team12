class CreateTagSubscriptions < ActiveRecord::Migration
  def change
    create_table :tag_subscriptions do |t|

      t.timestamps
    end
  end
end
