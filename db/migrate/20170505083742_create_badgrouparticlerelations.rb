class CreateBadgrouparticlerelations < ActiveRecord::Migration[5.0]


def up
    create_table :badgrouparticlerelations do |t|
    	t.integer :user_id 
    	t.integer :group_article_id 
      t.timestamps
    end
    add_index :badgrouparticlerelations,:user_id
    add_index :badgrouparticlerelations,:group_article_id
    add_index :badgrouparticlerelations,[:user_id,:group_article_id], unique: true
  end
  
  def down
  	drop_table :badgrouparticlerelations
  end
  

end
