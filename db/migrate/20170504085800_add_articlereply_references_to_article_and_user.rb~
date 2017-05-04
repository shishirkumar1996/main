class AddArticlereplyReferencesToArticleAndUser < ActiveRecord::Migration[5.0]
  def up
  	add_reference :articlereplies,:user,index: true, foreign_key: true
  	add_reference :articlereplies, :article,index: true,foreign_key: true
  end
  
  def down
  	remove_reference :articlereplies, :user,index: true
  	remove_reference :articlereplies, :article, index: true
  end
  
end
