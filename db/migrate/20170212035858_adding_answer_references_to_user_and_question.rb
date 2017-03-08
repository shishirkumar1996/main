class AddingAnswerReferencesToUserAndQuestion < ActiveRecord::Migration[5.0]
  def up
  	add_reference :answers,:user,index: true, foreign_key: true
  	add_reference :answers, :question, index: true, foreign_key: true
  end
  
  def down
  	remove_reference :answers,:user, index: true
  	remove_reference :answers, :question, index: true
  end
  
end
