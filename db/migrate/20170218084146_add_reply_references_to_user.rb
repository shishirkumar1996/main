class AddReplyReferencesToUser < ActiveRecord::Migration[5.0]
  def up
  	add_reference :replies,:user, index: true, foreign_key: true
  end
  
  def down
  	remove_reference :replies, :user, index: true
  end
end
