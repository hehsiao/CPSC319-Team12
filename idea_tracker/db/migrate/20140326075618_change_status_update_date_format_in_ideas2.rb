class ChangeStatusUpdateDateFormatInIdeas2 < ActiveRecord::Migration
  def up
   execute "ALTER TABLE ideas MODIFY COLUMN status_date_change DATETIME DEFAULT NOW();"
  end

  def down
   execute "ALTER TABLE ideas MODIFY COLUMN status_date_change DATE DEFAULT NULL;"
  end
end
