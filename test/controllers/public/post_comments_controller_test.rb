require "test_helper"

class Public::PostCommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get public_post_comments_edit_url
    assert_response :success
  end
end
