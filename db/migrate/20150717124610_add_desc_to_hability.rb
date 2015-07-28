class AddDescToHability < ActiveRecord::Migration
  def change
 	add_column :habilities, :desc, :string
  end
end
