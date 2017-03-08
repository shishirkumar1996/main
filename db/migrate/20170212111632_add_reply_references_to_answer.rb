class AddReplyReferencesToAnswer < ActiveRecord::Migration[5.0]
  def up
  	add_reference :replies,:answer, index: true, foreign_key: true
  end
  
  def down
  	remove_reference :replies,:answer,index:true
  end
end
