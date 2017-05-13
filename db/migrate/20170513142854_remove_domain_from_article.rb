class RemoveDomainFromArticle < ActiveRecord::Migration[5.0]
  def up
    remove_reference :articles, :domain, foreign_key: true, index: true
  end

  def down
    add_reference :articles, :domain, foreign_key: true, index: true
  end
end
