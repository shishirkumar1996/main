require 'test_helper'

class ArticlerepliesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @articlereply = articlereplies(:one)
  end

  test "should get index" do
    get articlereplies_url
    assert_response :success
  end

  test "should get new" do
    get new_articlereply_url
    assert_response :success
  end

  test "should create articlereply" do
    assert_difference('Articlereply.count') do
      post articlereplies_url, params: { articlereply: {  } }
    end

    assert_redirected_to articlereply_url(Articlereply.last)
  end

  test "should show articlereply" do
    get articlereply_url(@articlereply)
    assert_response :success
  end

  test "should get edit" do
    get edit_articlereply_url(@articlereply)
    assert_response :success
  end

  test "should update articlereply" do
    patch articlereply_url(@articlereply), params: { articlereply: {  } }
    assert_redirected_to articlereply_url(@articlereply)
  end

  test "should destroy articlereply" do
    assert_difference('Articlereply.count', -1) do
      delete articlereply_url(@articlereply)
    end

    assert_redirected_to articlereplies_url
  end
end
