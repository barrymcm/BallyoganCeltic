require 'test_helper'

class AccessControllerTest < ActionController::TestCase
  test "should get login" do
    get :login
    assert_response :success
  end

  test "should get public_menu" do
    get :public_menu
    assert_response :success
  end

  test "should get admin_menu" do
    get :admin_menu
    assert_response :success
  end

end
