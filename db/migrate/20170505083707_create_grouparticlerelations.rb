class CreateGrouparticlerelations < ActiveRecord::Migration[5.0]

def up
    create_table :grouparticlerelations do |t|
    	t.integer :user_id 
    	t.integer :group_article_id 
      t.timestamps
    end
    add_index :grouparticlerelations,:user_id
    add_index :grouparticlerelations,:group_article_id
    add_index :grouparticlerelations,[:user_id,:group_article_id], unique: true
  end
  
  def down
  	drop_table :grouparticlerelations
  end
  

end
