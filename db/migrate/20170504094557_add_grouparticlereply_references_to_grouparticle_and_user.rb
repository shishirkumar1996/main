class AddGrouparticlereplyReferencesToGrouparticleAndUser < ActiveRecord::Migration[5.0]
  def up
  	add_reference :grouparticlereplies, :user,index: true, foreign_key: true
  	add_reference :grouparticlereplies, :group_article, index: true, foreign_key: true
  end
  
  def down
  	remove_reference :grouparticlereplies, :user,index: true
  	remove_reference :grouparticlereplies, :group_article, index: true
  end
  
end
