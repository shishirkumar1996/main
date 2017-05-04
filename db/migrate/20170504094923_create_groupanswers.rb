class CreateGroupanswers < ActiveRecord::Migration[5.0]
  def up
    create_table :groupanswers do |t|
			t.text :body
      t.timestamps
    end
  end
  
  def down
  	drop_table :groupanswers
  end
  
end
