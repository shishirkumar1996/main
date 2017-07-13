class AddArticleRepliesCountToArticles < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :article_replies_count, :integer, default: 0, null: false

    reversible do |dir|
      dir.up { data }
    end
  end

  def data
    execute <<-SQL.squish
      UPDATE articles
        SET article_replies_count = (SELECT count(1)
                               FROM article_replies
                              WHERE article_replies.article_id = articles.id)
    SQL
  end
end
