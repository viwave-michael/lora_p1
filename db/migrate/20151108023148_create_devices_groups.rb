class CreateDevicesGroups < ActiveRecord::Migration
  def change
    create_table :devices_groups, id: false do |t|
      t.belongs_to :device, index: true
      t.belongs_to :group, index: true
    end
  end
end
