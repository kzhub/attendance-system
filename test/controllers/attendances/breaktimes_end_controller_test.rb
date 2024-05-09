require "test_helper"

class Attendances::BreaktimesEndControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get attendances_breaktimes_end_create_url
    assert_response :success
  end
end
