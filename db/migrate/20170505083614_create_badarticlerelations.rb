class CreateBadarticlerelations < ActiveRecord::Migration[5.0]
  def up
    create_table :badarticlerelations do |t|
    	t.integer :user_id 
    	t.integer :article_id  
      t.timestamps
    end
    add_index :badarticlerelations,:user_id
    add_index :badarticlerelations,:article_id
    add_index :badarticlerelations,[:article_id,:user_id], unique: true
  end
  
  def down
  	drop_table :badarticlerelations
  end
  
end
