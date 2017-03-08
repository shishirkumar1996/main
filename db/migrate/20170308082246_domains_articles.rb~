class DomainsArticles < ActiveRecord::Migration[5.0]
  def up
  	create_table :domains_articles do |t|
  		t.integer :domain_id
  		t.integer :article_id
  	end
  	add_index :domains_articles, :domain_id
  	add_index :domains_articles, :article_id
  	add_index :domains_articles, [:domain_id, :article_id], unique: true
  end
  
  def down
  	drop_table :domain_articles
  end	
  
end
