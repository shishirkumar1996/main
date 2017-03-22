class CreateInterests < ActiveRecord::Migration[5.0]
  def up
    create_table :interests do |t|
    	t.integer :person_id    #refers to the domain 
    	t.integer :interested_id  #refers to theuserinterested
      t.timestamps
    end
    add_index :interests, :interested_id
    add_index :interests, :person_id
    add_index :interests, [:person_id, :interested_id], unique: true
  end
  
  def down
  	drop_table :interests
  end
end
