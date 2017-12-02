class RenameBookmarkRelations < ActiveRecord::Migration[5.0]
  def up
    rename_table :article_bookmark_relations, :article_bookmarks
    rename_table :answer_bookmark_relations, :answer_bookmarks
    rename_table :question_bookmark_relations, :question_bookmarks
  end
  def down
    rename_table :article_bookmarks, :article_bookmark_relations
    rename_table :answer_bookmarks, :answer_bookmark_relations
    rename_table :question_bookmarks, :question_bookmark_relations
  end
end
