require 'test_helper'

class GrouparticlerepliesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @grouparticlereply = grouparticlereplies(:one)
  end

  test "should get index" do
    get grouparticlereplies_url
    assert_response :success
  end

  test "should get new" do
    get new_grouparticlereply_url
    assert_response :success
  end

  test "should create grouparticlereply" do
    assert_difference('Grouparticlereply.count') do
      post grouparticlereplies_url, params: { grouparticlereply: {  } }
    end

    assert_redirected_to grouparticlereply_url(Grouparticlereply.last)
  end

  test "should show grouparticlereply" do
    get grouparticlereply_url(@grouparticlereply)
    assert_response :success
  end

  test "should get edit" do
    get edit_grouparticlereply_url(@grouparticlereply)
    assert_response :success
  end

  test "should update grouparticlereply" do
    patch grouparticlereply_url(@grouparticlereply), params: { grouparticlereply: {  } }
    assert_redirected_to grouparticlereply_url(@grouparticlereply)
  end

  test "should destroy grouparticlereply" do
    assert_difference('Grouparticlereply.count', -1) do
      delete grouparticlereply_url(@grouparticlereply)
    end

    assert_redirected_to grouparticlereplies_url
  end
end
