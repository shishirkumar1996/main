class AddGroupAnswerReferenceToGroupQuestionAndUser < ActiveRecord::Migration[5.0]
   def up
  	add_reference :groupanswers, :user,index: true, foreign_key: true
  	add_reference :groupanswers, :group_question, index: true,foreign_key: true
  end
  
  def down
  	remove_reference :groupanswers, :user, index: true
  	remove_reference :groupanswers, :group_question, index: true
  end
end
