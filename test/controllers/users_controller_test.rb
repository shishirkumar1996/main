require 'test_helper'
	
	
class UserControllerTest < ActionDispatch::IntegrationTest

def setup
	@shishir1 = users(:shishir1)
	@shishir2 = users(:shishir2)
end

test "should get new" do
	get signup_path
	assert_response :success
end

test "should redirect edit when not logged in" do
	get edit_user_path(@shishir1)
	assert_not flash.empty?
	assert_redirected_to root_url
end

test "should redirect edit when logged in as wrong user" do
	log_in_as(@shishir1)
	get edit_user_path(@shishir2)
	assert flash.empty?
	assert_redirected_to root_url
end


end
