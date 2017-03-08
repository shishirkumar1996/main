class AddingQuestionReferencesToUserAndDomain < ActiveRecord::Migration[5.0]
  def up
  	add_reference :questions, :user, index: true, foreign_key: true
  	add_reference :questions, :domain, index: true, foreign_key: true
  end
  
  def down
  	remove_reference :questions,:user, index: true
  	remove_reference :questions,:domain, index: true
  end
end
