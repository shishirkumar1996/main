class AddActorIdToNotifications < ActiveRecord::Migration[5.0]
  def up
  	add_column :notifications, :actor_id,:integer
  end
  
  def down
  	remove_column :notifications,:actor_id
  end
  
end
