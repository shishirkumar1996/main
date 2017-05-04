class CreateGroupquestionreplies < ActiveRecord::Migration[5.0]
  def up
    create_table :groupquestionreplies do |t|
			t.text :body
      t.timestamps
    end
  end
  
  def down
  	drop_table :groupquestionreplies
  end
  
end
