class CreateAnswers < ActiveRecord::Migration[5.0]
  def up
    create_table :answers do |t|
			t.text :body
      t.timestamps
    end
  end
  
  def down
  	drop_table :answers
  end
end
