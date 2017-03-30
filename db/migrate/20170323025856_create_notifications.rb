class CreateNotifications < ActiveRecord::Migration[5.0]
  def up
    create_table :notifications do |t|
			t.string :message
			t.string :link
      t.timestamps
    end
  end
  
  def down
  	drop_table :notifications
  end
end
