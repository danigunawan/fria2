require 'test_helper'

class CommitteeMemberControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get committee_member_index_url
    assert_response :success
  end

end
