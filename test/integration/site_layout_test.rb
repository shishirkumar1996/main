require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

	def setup
		@user = users(:shishir1)
		log_in_as(@user)
	end



	test "layout links" do
		get root_path
		assert_template 'static_pages/home'
		assert_select "a[href=?]",user_notifications_path(@user)
		assert_select "a[href=?]",user_path(@user)
		
		end
	end
