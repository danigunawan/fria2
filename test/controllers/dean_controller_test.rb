require 'test_helper'

class DeanControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dean_index_url
    assert_response :success
  end

end
