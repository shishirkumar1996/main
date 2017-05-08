class CreateBadanswerrelations < ActiveRecord::Migration[5.0]


def up
    create_table :badanswerrelations do |t|
    	t.integer :user_id 
    	t.integer :answer_id 
      t.timestamps
    end
    add_index :badanswerrelations,:user_id
    add_index :badanswerrelations,:answer_id
    add_index :badanswerrelations,[:user_id,:answer_id], unique: true
  end
  
  def down
  	drop_table :badanswerrelations
  end
  

end
