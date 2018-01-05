class RemoveUnnecessaryColumnsFromNotifications < ActiveRecord::Migration[5.0]
  def change
    remove_column :notifications, :message, :string
    remove_column :notifications, :link, :string
    remove_column :notifications, :actor_id, :integer
  end
end
