require "test_helper"

class Attendances::BreaktimesStartControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get attendances_breaktimes_start_create_url
    assert_response :success
  end
end
