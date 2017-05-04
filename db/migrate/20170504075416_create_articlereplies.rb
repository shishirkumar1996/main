class CreateArticlereplies < ActiveRecord::Migration[5.0]
  def up
    create_table :articlereplies do |t|
    	t.text :body
      t.timestamps
    end
  end
  
  def down
  	drop_table :articlereplies
  end
end
