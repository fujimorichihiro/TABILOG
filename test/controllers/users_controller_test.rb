require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get users_show_url
    assert_response :success
  end

  test "should get edit" do
    get users_edit_url
    assert_response :success
  end

  test "should get update" do
    get users_update_url
    assert_response :success
  end

  test "should get follower" do
    get users_follower_url
    assert_response :success
  end

  test "should get followed" do
    get users_followed_url
    assert_response :success
  end

end
