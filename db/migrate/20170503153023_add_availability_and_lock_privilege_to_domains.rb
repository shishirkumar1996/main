class AddAvailabilityAndLockPrivilegeToDomains < ActiveRecord::Migration[5.0]
  def up
  	add_column :domains, :available, :boolean, default: true
  	add_column :domains, :locked, :boolean, default: false
  end
  
  def down
  	remove_column :domains, :available
  	remove_column :domains, :locked
  end
end
