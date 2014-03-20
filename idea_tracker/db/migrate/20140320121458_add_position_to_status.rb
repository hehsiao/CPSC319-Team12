class AddPositionToStatus < ActiveRecord::Migration
  def change
    add_column :statuses, :position, :integer
  end

end
