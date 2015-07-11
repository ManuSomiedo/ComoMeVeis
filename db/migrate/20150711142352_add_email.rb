class AddEmail < ActiveRecord::Migration
  def change
	add_column :users, :email, :string
        add_column :users, :logged_in, :boolean
  end
end
