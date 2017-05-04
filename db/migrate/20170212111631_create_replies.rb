class CreateReplies < ActiveRecord::Migration[5.0]
  def up
    create_table :replies do |t|
			t.text :body
      t.timestamps
    end
  end
  
  def down
  	drop_table :replies
  end
  
end
