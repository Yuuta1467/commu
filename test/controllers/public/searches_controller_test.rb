require "test_helper"

class Public::SearchesControllerTest < ActionDispatch::IntegrationTest
  test "should get searh" do
    get public_searches_searh_url
    assert_response :success
  end
end
