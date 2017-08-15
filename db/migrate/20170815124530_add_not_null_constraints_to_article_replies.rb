class AddNotNullConstraintsToArticleReplies < ActiveRecord::Migration[5.0]
  def up
    change_column_null :article_replies, :body, false
    change_column_null :article_replies, :user_id, false
    change_column_null :article_replies, :article_id, false
  end

  def down
    change_column_null :article_replies, :body, true
    change_column_null :article_replies, :user_id, true
    change_column_null :article_replies, :article_id, true
  end
end
