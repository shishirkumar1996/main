class CreateAcademics < ActiveRecord::Migration[5.0]
  def up
    create_table :academics do |t|
			t.integer :university_id   #refers to the domain
			t.integer :student_id     #refers to the student
      t.timestamps
    end
    add_index :academics, :university_id
    add_index :academics, :student_id
    add_index :academics, [:university_id, :student_id],unique: true
   end
   
  def down
  	drop_table :academics 
  end
end
