require 'test_helper'

class GroupquestionrepliesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @groupquestionreply = groupquestionreplies(:one)
  end

  test "should get index" do
    get groupquestionreplies_url
    assert_response :success
  end

  test "should get new" do
    get new_groupquestionreply_url
    assert_response :success
  end

  test "should create groupquestionreply" do
    assert_difference('Groupquestionreply.count') do
      post groupquestionreplies_url, params: { groupquestionreply: {  } }
    end

    assert_redirected_to groupquestionreply_url(Groupquestionreply.last)
  end

  test "should show groupquestionreply" do
    get groupquestionreply_url(@groupquestionreply)
    assert_response :success
  end

  test "should get edit" do
    get edit_groupquestionreply_url(@groupquestionreply)
    assert_response :success
  end

  test "should update groupquestionreply" do
    patch groupquestionreply_url(@groupquestionreply), params: { groupquestionreply: {  } }
    assert_redirected_to groupquestionreply_url(@groupquestionreply)
  end

  test "should destroy groupquestionreply" do
    assert_difference('Groupquestionreply.count', -1) do
      delete groupquestionreply_url(@groupquestionreply)
    end

    assert_redirected_to groupquestionreplies_url
  end
end
