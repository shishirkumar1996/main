class AddArticleReplyReferencesToArticleAndUser < ActiveRecord::Migration[5.0]
  def up
  	add_reference :article_replies,:user,index: true, foreign_key: true
  	add_reference :article_replies, :article,index: true,foreign_key: true
  end

  def down
  	remove_reference :article_replies, :user,index: true
  	remove_reference :article_replies, :article, index: true
  end

end
