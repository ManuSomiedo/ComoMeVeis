class CreateValorations < ActiveRecord::Migration
  def change
    create_table :valorations do |t|
      t.references :user, index: true, foreign_key: true
      t.references :hability, index: true, foreign_key: true
      t.integer :points
      t.datetime :date

      t.timestamps null: false
    end
  end
end
