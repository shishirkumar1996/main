class AddReadTimestampToNotifications < ActiveRecord::Migration[5.0]
  def up
  	add_column :notifications,:read_at,:datetime,default: nil
  end
  
  def down
  	remove_column :notifications,:read_at
  end
  
end
