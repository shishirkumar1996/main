class RenameArticleRelations < ActiveRecord::Migration[5.0]
  def up
    rename_table :articlerelations, :article_upvotes
    rename_table :badarticlerelations, :article_downvotes
  end
  def down
    rename_table :article_upvotes, :articlerelations
    rename_table :article_downvotes, :badarticlerelations
  end
end
