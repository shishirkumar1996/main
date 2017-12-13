class AddXorConstraintToArticleReplies < ActiveRecord::Migration[5.0]
  def up
    execute <<-SQL
      ALTER TABLE article_replies ADD CONSTRAINT article_or_parent_reply_xor
        CHECK(
          (article_id IS NOT NULL OR parent_reply_id IS NOT NULL)
           AND NOT
          (article_id IS NOT NULL AND parent_reply_id IS NOT NULL)
        );
    SQL
  end
  def down
    execute <<-SQL
      ALTER TABLE article_replies
        DROP CONSTRAINT IF EXISTS article_or_parent_reply_xor;
    SQL
  end
end
