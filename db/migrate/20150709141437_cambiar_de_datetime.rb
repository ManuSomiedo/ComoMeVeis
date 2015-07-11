class CambiarDeDatetime < ActiveRecord::Migration
  def change
	change_column :valorations, :date, :string
  end
  def down
  change_column :valorations, :date, :datetime
  end
end
