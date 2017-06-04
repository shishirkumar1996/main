require 'test_helper'

class UserEditTest < ActionDispatch::IntegrationTest


def setup
	@user = users(:shishir1)
end


test "unsuccessful edit of name" do
	log_in_as(@user)
	get edit_user_path(@user)
	assert_template 'users/edit'
	post update_name_user_path(@user), params: {user: {name: "" }}
	assert_redirected_to edit_user_path(@user)
	assert_not flash.empty?
end


test "successful edit of name" do
	log_in_as(@user)
	get edit_user_path(@user)
	assert_template 'users/edit'
	name = "Foo bar"
	post update_name_user_path(@user),params: {user: {name: name}}
	assert_not flash.empty?
	assert_redirected_to user_path(@user)
end
	

test "unsuccessful edit of password" do
	log_in_as(@user)
	get edit_password_user_path(@user)
	assert_template 'users/edit_password'
	password = 'password'
	post update_password_user_path(@user),params: {user: {old_password: password,password: "",password_confirmation: ""}}
	
	assert_not flash.empty?
	assert_redirected_to edit_password_user_path(@user)
end



test "successful edit of password" do
	log_in_as(@user)
	get edit_password_user_path(@user)
	old_password = 'password'
	password = 'foobar'
	assert_template 'users/edit_password'
	post update_password_user_path(@user),params: {user: {old_password: old_password,password: password,password_confirmation: password}}
		
	assert_redirected_to user_path(@user)
end


end
