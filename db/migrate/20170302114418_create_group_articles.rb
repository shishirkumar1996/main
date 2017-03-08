class CreateGroupArticles < ActiveRecord::Migration[5.0]
  def up
    create_table :group_articles do |t|
			t.string :title
			t.text :body
      t.timestamps
    end
  end
  
  def down
  	drop_table :group_articles
  end
  
end
