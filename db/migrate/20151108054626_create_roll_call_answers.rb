class CreateRollCallAnswers < ActiveRecord::Migration
  def change
    create_table :roll_call_answers do |t|
      t.references :roll_call, index: true, foreign_key: true
      t.references :device, index: true, foreign_key: true
      t.datetime :when
      t.float :lng
      t.float :lat

      t.timestamps null: false
    end
  end
end
