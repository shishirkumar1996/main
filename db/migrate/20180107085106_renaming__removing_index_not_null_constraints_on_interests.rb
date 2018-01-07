class RenamingRemovingIndexNotNullConstraintsOnInterests < ActiveRecord::Migration[5.0]
  def change
    rename_table :interests, :user_interests
    rename_column :user_interests, :person_id, :user_id
    change_column_null :user_interests, :user_id, false
    rename_column :user_interests, :interested_id, :domain_id
    change_column_null :user_interests, :domain_id, false
    remove_index :user_interests, :user_id
  end
end
