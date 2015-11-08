class CreateRollCalls < ActiveRecord::Migration
  def change
    create_table :roll_calls do |t|
      t.references :device, index: true, foreign_key: true
      t.datetime :when
      t.float :lng
      t.float :lat
      t.boolean :manual

      t.timestamps null: false
    end
  end
end
