class AddGroupArticleReferenceToGroupAndUser < ActiveRecord::Migration[5.0]
  def up
  	add_reference :group_articles, :user,index: true, foreign_key:  true
  	add_reference :group_articles, :group, index: true, foreign_key: true
  end
  
  def down
  	remove_reference :group_articles, :user,index: true
  	remove_reference :group_articles,:group,index:true
  end
end
