require 'test_helper'

class PublicSiteControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get results" do
    get :results
    assert_response :success
  end

  test "should get teams" do
    get :teams
    assert_response :success
  end

  test "should get fixtures" do
    get :fixtures
    assert_response :success
  end

  test "should get leagues" do
    get :leagues
    assert_response :success
  end

end
