require "test_helper"

class ReservationsControllerTest < ActionDispatch::IntegrationTest
  test "should get reserve" do
    get reservations_reserve_url
    assert_response :success
  end

  test "should get show" do
    get reservations_show_url
    assert_response :success
  end
end
