require "test_helper"

class Public::LilesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get public_liles_create_url
    assert_response :success
  end

  test "should get destroy" do
    get public_liles_destroy_url
    assert_response :success
  end
end
