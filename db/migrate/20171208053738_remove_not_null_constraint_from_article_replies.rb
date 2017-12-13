class RemoveNotNullConstraintFromArticleReplies < ActiveRecord::Migration[5.0]
  def change
    change_column_null :article_replies, :article_id, true
  end
end
