class CreateQuestions < ActiveRecord::Migration[5.0]
  def up
    create_table :questions do |t|
  	  t.string :title
	    t.text :description
	    t.boolean :anonymous
      t.timestamps
    end
 	end
 	
 	def down
 		drop_table :questions
 	end
 	
end
