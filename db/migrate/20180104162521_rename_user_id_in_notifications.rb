class RenameUserIdInNotifications < ActiveRecord::Migration[5.0]
  def change
    rename_column :notifications, :user_id, :recipient_id
    change_column_null :notifications, :recipient_id, false
  end
end
