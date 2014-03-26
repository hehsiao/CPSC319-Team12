class ChangeStatusUpdateDateFormatInIdeas2 < ActiveRecord::Migration
  def self.up
   execute "ALTER TABLE ideas MODIFY COLUMN status_date_change DATETIME DEFAULT NOW()"
  end

  def self.down
   execute "ALTER TABLE ideas MODIFY COLUMN status_date_change DATE DEFAULT NULL"
  end
end
