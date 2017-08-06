class RemoveIndicesFromQuestionBookmarkRelations < ActiveRecord::Migration[5.0]
  def up
    remove_index :question_bookmark_relations, :user_id
    remove_index :question_bookmark_relations, :question_id
  end

  def down
    add_index :question_bookmark_relations, :user_id
    add_index :question_bookmark_relations, :question_id
  end
end
