class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.references :path, index: true, foreign_key: true
      t.datetime :when
      t.float :lng
      t.float :lat

      t.timestamps null: false
    end
  end
end
