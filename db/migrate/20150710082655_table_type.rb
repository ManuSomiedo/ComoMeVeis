class TableType < ActiveRecord::Migration
  def change
	change_column :valorations, :date, :datetime
  end
end
