class AddGroupAnswerArticlesReferences < ActiveRecord::Migration[5.0]
  def up
  	add_reference :group_questions,:user,index: true,foreign_key: true
  	add_reference :group_questions,:group,index: true,foreign_key:
  	true
  end
  
  def down
  	remove_reference :group_questions,:user,index: true
  	remove_reference :group_questions,:group,index: true
  end
end
