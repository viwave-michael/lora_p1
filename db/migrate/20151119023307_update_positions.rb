class UpdatePositions < ActiveRecord::Migration
  def change
    remove_column :positions, :path_id, :integer
    add_column :positions, :device_id, :integer
  end
end
