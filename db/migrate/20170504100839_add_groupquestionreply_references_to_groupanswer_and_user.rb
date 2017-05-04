class AddGroupquestionreplyReferencesToGroupanswerAndUser < ActiveRecord::Migration[5.0]
  def up
  	add_reference :groupquestionreplies, :user,index: true, foreign_key: true
  	add_reference :groupquestionreplies, :groupanswer,index: true, foreign_key: true
  end
  
  def down
  	remove_reference :groupquestionreplies,:user,index: true
  	remove_reference :groupquestionreplies, :groupanswer, index: true
  end
  
end
