class CreateAnswerBookmarkRelations < ActiveRecord::Migration[5.0]
  def up
    create_table :answer_bookmark_relations do |t|
			t.integer :user_id
			t.integer :answer_id
      t.timestamps
    end
    add_index :answer_bookmark_relations,:user_id
    add_index :answer_bookmark_relations,:answer_id
    add_index :answer_bookmark_relations,[:user_id,:answer_id],unique: true
  end
  
  
  def down
  	drop_table :answer_bookmark_relations
  end
  
  
end
