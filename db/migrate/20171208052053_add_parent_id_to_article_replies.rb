class AddParentIdToArticleReplies < ActiveRecord::Migration[5.0]
  def up
    add_reference :article_replies, :parent_reply, index: true
    add_foreign_key :article_replies, :article_replies, column: :parent_reply_id
  end
  def down
    remove_foreign_key :article_replies, column: :parent_reply_id
    remove_reference :article_replies, :parent_reply, index: true
  end
end
