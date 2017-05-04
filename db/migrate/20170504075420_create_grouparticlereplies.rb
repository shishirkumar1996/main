class CreateGrouparticlereplies < ActiveRecord::Migration[5.0]
  def up
    create_table :grouparticlereplies do |t|
			t.text :body
      t.timestamps
     end
    end
  
  def down
  	drop_table :grouparticlereplies
  end  
    
  
end
