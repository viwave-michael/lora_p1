class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :serial
      t.string :capability

      t.timestamps null: false
    end
  end
end
