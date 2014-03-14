class AddStatusToIdea < ActiveRecord::Migration
  def self.up
  	add_column :ideas, :status, :integer, :null => false, :default => 1
  end

  def self.down
  	remove_column :ideas, :status, :integer
  end
end
