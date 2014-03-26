class ChangeStatusToStatusId < ActiveRecord::Migration
  def up
  	rename_column :ideas, :status, :status_id
  end

  def down
  	rename_column :ideas, :status_id, :status
  end
end
