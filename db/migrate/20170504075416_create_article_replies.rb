class CreateArticleReplies < ActiveRecord::Migration[5.0]
  def up
    create_table :article_replies do |t|
    	t.text :body
      t.timestamps
    end
  end

  def down
  	drop_table :article_replies
  end
end
