require 'test_helper'

class GroupanswersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @groupanswer = groupanswers(:one)
  end

  test "should get index" do
    get groupanswers_url
    assert_response :success
  end

  test "should get new" do
    get new_groupanswer_url
    assert_response :success
  end

  test "should create groupanswer" do
    assert_difference('Groupanswer.count') do
      post groupanswers_url, params: { groupanswer: {  } }
    end

    assert_redirected_to groupanswer_url(Groupanswer.last)
  end

  test "should show groupanswer" do
    get groupanswer_url(@groupanswer)
    assert_response :success
  end

  test "should get edit" do
    get edit_groupanswer_url(@groupanswer)
    assert_response :success
  end

  test "should update groupanswer" do
    patch groupanswer_url(@groupanswer), params: { groupanswer: {  } }
    assert_redirected_to groupanswer_url(@groupanswer)
  end

  test "should destroy groupanswer" do
    assert_difference('Groupanswer.count', -1) do
      delete groupanswer_url(@groupanswer)
    end

    assert_redirected_to groupanswers_url
  end
end
