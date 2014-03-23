class AddOwneridToIdeas < ActiveRecord::Migration
  def self.up
    add_column :ideas, :owner_id, :integer
  end

  def self.down
    remove_column :ideas, :owner_id
  end

end
