class AddingAnonymousFieldToAnswer < ActiveRecord::Migration[5.0]
  def up
  	add_column :answers,:anonymous,:boolean,default: false
  end
  
  def down
  	remove_column :answers,:anonymous
  end
end
