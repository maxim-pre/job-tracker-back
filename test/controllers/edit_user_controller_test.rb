require "test_helper"

class EditUserControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get edit_user_update_url
    assert_response :success
  end
end
