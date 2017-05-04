require 'test_helper'

class AssociatedSetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @associated_set = associated_sets(:one)
  end

  test "should get index" do
    get associated_sets_url
    assert_response :success
  end

  test "should get new" do
    get new_associated_set_url
    assert_response :success
  end

  test "should create associated_set" do
    assert_difference('AssociatedSet.count') do
      post associated_sets_url, params: { associated_set: {  } }
    end

    assert_redirected_to associated_set_url(AssociatedSet.last)
  end

  test "should show associated_set" do
    get associated_set_url(@associated_set)
    assert_response :success
  end

  test "should get edit" do
    get edit_associated_set_url(@associated_set)
    assert_response :success
  end

  test "should update associated_set" do
    patch associated_set_url(@associated_set), params: { associated_set: {  } }
    assert_redirected_to associated_set_url(@associated_set)
  end

  test "should destroy associated_set" do
    assert_difference('AssociatedSet.count', -1) do
      delete associated_set_url(@associated_set)
    end

    assert_redirected_to associated_sets_url
  end
end
