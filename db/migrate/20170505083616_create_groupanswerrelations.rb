class CreateGroupanswerrelations < ActiveRecord::Migration[5.0]
   def up
    create_table :groupanswerrelations do |t|
    	t.integer :user_id 
    	t.integer :group_answer_id 
      t.timestamps
    end
    add_index :groupanswerrelations,:user_id
    add_index :groupanswerrelations,:group_answer_id
    add_index :groupanswerrelations,[:user_id,:group_answer_id], unique: true
  end
  
  def down
  	drop_table :groupanswerrelations
  end
  
end
