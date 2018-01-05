class AddForeignKeysToNotifications < ActiveRecord::Migration[5.0]
  def change
    add_reference :notifications, :article_reply, foreign_key: { to_table: :article_replies }, index: false
    add_reference :notifications, :answer_reply, foreign_key: { to_table: :answer_replies }, index: false
    add_reference :notifications, :answer, foreign_key: true, index: false
    add_reference :notifications, :user_following, foreign_key: { to_table: :relationships }, index: false
  end
end
