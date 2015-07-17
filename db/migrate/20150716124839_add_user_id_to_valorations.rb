class AddUserIdToValorations < ActiveRecord::Migration
  def change
    add_column :valorations, :sender_id, :integer
  end
end
