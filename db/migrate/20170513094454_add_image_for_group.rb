class AddImageForGroup < ActiveRecord::Migration[5.0]
  def up
  	add_column :groups,:image,:string
  end
  
  def down
  	remove_column :groups,:image
  end
  
end
