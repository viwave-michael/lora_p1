class CreateHelpCalls < ActiveRecord::Migration
  def change
    create_table :help_calls do |t|
      t.references :device, index: true, foreign_key: true
      t.datetime :when
      t.float :lng
      t.float :lat

      t.timestamps null: false
    end
  end
end
