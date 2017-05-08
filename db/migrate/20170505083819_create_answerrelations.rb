class CreateAnswerrelations < ActiveRecord::Migration[5.0]


def up
    create_table :answerrelations do |t|
    	t.integer :user_id 
    	t.integer :answer_id 
      t.timestamps
    end
    add_index :answerrelations,:user_id
    add_index :answerrelations,:answer_id
    add_index :answerrelations,[:user_id,:answer_id], unique: true
  end
  
  def down
  	drop_table :answerrelations
  end
  
end
