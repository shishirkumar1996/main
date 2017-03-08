class AddingReferencesToUserAndDomain < ActiveRecord::Migration[5.0]
  def up
  	add_reference :articles, :user, index: true,foreign_key: true
  #	add_foreign_key :articles, :users
  	add_reference :articles, :domain , index: true,foreign_key: true
  #	add_foreign_key :articles, :domains
  end
  
  def down
  	remove_reference :articles, :user, index: true
 	#	remove_foreign_key :articles, :users
  	remove_reference :articles, :domain, index: true
  #	remove_foreign_key :articles, :domains
	end
end
