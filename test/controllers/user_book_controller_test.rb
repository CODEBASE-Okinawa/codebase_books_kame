require "test_helper"

class UserBookControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get user_book_show_url
    assert_response :success
  end
end
