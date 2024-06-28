require "test_helper"

class CandlesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get candles_create_url
    assert_response :success
  end
end
