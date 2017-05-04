class CreateAssociatedSets < ActiveRecord::Migration[5.0]
  def up
    create_table :associated_sets do |t|
			t.integer :superset_id
			t.integer :subset_id
   
      t.timestamps
    end
    add_index :associated_sets, :superset_id
    add_index :associated_sets, :subset_id
    add_index :associated_sets, [:superset_id,:subset_id],unique: true
  end
  
  
  def down
  	drop_table :associated_sets
  end
  
end
