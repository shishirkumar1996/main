class CreateGroupQuestions < ActiveRecord::Migration[5.0]
  def up
    create_table :group_questions do |t|
			t.string :title
			t.text :description
      t.timestamps
    end
  end
  
  def down
  	drop_table :group_questions
  end
  
  
end
