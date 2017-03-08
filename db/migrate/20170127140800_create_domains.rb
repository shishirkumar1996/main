class CreateDomains < ActiveRecord::Migration[5.0]
  def up
    create_table :domains do |t|
    	t.string :name
      t.timestamps
   end
  end
    
   def down
   	drop_table :domains
   end
end
