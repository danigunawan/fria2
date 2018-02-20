require 'test_helper'

class ResearcherControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get researcher_index_url
    assert_response :success
  end

end
