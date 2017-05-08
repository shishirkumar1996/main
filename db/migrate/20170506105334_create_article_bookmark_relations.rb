class CreateArticleBookmarkRelations < ActiveRecord::Migration[5.0]
  def up
    create_table :article_bookmark_relations do |t|
			t.integer :user_id
			t.integer :article_id
      t.timestamps
    end
    add_index :article_bookmark_relations,:user_id
    add_index :article_bookmark_relations,:article_id
    add_index :article_bookmark_relations,[:user_id,:article_id],
    unique: true
  end
  
  def down
  	drop_table :article_bookmark_relations
  end
  
end
