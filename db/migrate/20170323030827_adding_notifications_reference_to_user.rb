class AddingNotificationsReferenceToUser < ActiveRecord::Migration[5.0]
  def up
  	add_reference :notifications, :user, index: true, foreign_key: true
  end
  def down
  	remove_reference :notifications, :user, index: true
  end
end
