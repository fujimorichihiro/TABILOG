require 'test_helper'

class PostimagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get postimages_index_url
    assert_response :success
  end

end
