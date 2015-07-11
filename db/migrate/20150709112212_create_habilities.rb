class CreateHabilities < ActiveRecord::Migration
  def change
    create_table :habilities do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
