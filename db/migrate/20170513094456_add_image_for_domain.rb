class AddImageForDomain < ActiveRecord::Migration[5.0]
  def up
  	add_column :domains,:image,:string
  end
  
  def down
  	remove_column :domains,:image
  end
  
end
