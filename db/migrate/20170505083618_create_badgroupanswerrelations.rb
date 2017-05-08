class CreateBadgroupanswerrelations < ActiveRecord::Migration[5.0]
def up
    create_table :badgroupanswerrelations do |t|
    	t.integer :user_id 
    	t.integer :group_answer_id 
      t.timestamps
    end
    add_index :badgroupanswerrelations,:user_id
    add_index :badgroupanswerrelations,:group_answer_id
    add_index :badgroupanswerrelations,[:user_id,:group_answer_id], unique: true
  end
  
  def down
  	drop_table :badgroupanswerrelations
  end
  

end
