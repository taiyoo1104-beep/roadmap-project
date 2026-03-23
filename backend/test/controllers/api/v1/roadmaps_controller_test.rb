require "test_helper"

class Api::V1::RoadmapsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_v1_roadmaps_index_url
    assert_response :success
  end
end
