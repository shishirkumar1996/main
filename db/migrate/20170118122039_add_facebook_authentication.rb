class AddFacebookAuthentication < ActiveRecord::Migration[5.0]
  def up
  	add_column :users, :provider, :string
  	add_column :users,  :oauth_token, :string
  	add_column :users, :oauth_expires_at, :datetime
  	add_column :users, :uid,:string
  end
  
  def down
  	remove_column :users, :provider
  	remove_column :users, :oauth_token
  	remove_column :users, :oauth_expires_at
  	remove_column :users, :uid
  end
end
