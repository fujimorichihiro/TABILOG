require 'test_helper'

class Admins::InquiriesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get admins_inquiries_show_url
    assert_response :success
  end

  test "should get index" do
    get admins_inquiries_index_url
    assert_response :success
  end

end
