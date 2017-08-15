class RemoveIndexFromRelationships < ActiveRecord::Migration[5.0]
  def up
    remove_index :relationships, :follower_id
  end

  def down
    add_index :relationships, :follower_id
  end
end
