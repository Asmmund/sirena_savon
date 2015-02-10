require 'test_helper'

class OrdersControllerTest < ActionController::TestCase
  test "should get notify" do
    get :notify
    assert_response :success
  end

end
