class CreateHelpCallAnswers < ActiveRecord::Migration
  def change
    create_table :help_call_answers do |t|
      t.references :device, index: true, foreign_key: true
      t.references :help_call, index: true, foreign_key: true
      t.datetime :when
      t.float :lng
      t.float :lat

      t.timestamps null: false
    end
  end
end
