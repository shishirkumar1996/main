class CreateDomainsQuestions < ActiveRecord::Migration[5.0]
  def up
  	create_table :domains_questions do |t|
  		t.integer :domain_id
  		t.integer :question_id
		end
		add_index :domains_questions, :domain_id
		add_index :domains_questions, :question_id
		add_index :domains_questions, [:domain_id,:question_id], unique: true
  end
  
  def down
  	drop_table :domains_questions
  end
  
  
end
