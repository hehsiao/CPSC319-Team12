class AddSummaryToIdea < ActiveRecord::Migration
  def self.up
    add_column :ideas, :summary, :string
  end

  def self.down
    remove_column :ideas, :summary
  end
end
