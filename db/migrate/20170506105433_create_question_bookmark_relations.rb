class CreateQuestionBookmarkRelations < ActiveRecord::Migration[5.0]
  def up
    create_table :question_bookmark_relations do |t|
			t.integer :user_id
			t.integer :question_id
      t.timestamps
    end
    add_index :question_bookmark_relations,:user_id
    add_index :question_bookmark_relations,:question_id
    add_index :question_bookmark_relations,[:user_id,:question_id],
    unique: true
  end
  
  def down
  	drop_table :question_bookmark_relations
  end
  
  
end
