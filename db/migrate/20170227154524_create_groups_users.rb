class CreateGroupsUsers < ActiveRecord::Migration[5.0]
 	def up
 		create_table :groups_users do |t|
 		 t.integer :user_id
 		 t.integer :group_id
     t.timestamps
 		end
  end

  def down
  	drop_table :groups_users
  end
end
