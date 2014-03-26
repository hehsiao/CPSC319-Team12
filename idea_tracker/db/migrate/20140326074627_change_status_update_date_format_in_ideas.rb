class ChangeStatusUpdateDateFormatInIdeas < ActiveRecord::Migration
  def self.up
   change_column :ideas, :status_date_change, :datetime, :default => Time.now
  end

  def self.down
   change_column :ideas, :status_date_change, :date, :default => null
  end
end
