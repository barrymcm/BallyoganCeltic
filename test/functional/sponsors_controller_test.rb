require 'test_helper'

class SponsorsControllerTest < ActionController::TestCase
  setup do
    @sponsor = sponsors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sponsors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sponsor" do
    assert_difference('Sponsor.count') do
      post :create, sponsor: { company_name: @sponsor.company_name, email: @sponsor.email, first_name: @sponsor.first_name, last_name: @sponsor.last_name, location: @sponsor.location, package: @sponsor.package, phone: @sponsor.phone, title: @sponsor.title }
    end

    assert_redirected_to sponsor_path(assigns(:sponsor))
  end

  test "should show sponsor" do
    get :show, id: @sponsor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sponsor
    assert_response :success
  end

  test "should update sponsor" do
    put :update, id: @sponsor, sponsor: { company_name: @sponsor.company_name, email: @sponsor.email, first_name: @sponsor.first_name, last_name: @sponsor.last_name, location: @sponsor.location, package: @sponsor.package, phone: @sponsor.phone, title: @sponsor.title }
    assert_redirected_to sponsor_path(assigns(:sponsor))
  end

  test "should destroy sponsor" do
    assert_difference('Sponsor.count', -1) do
      delete :destroy, id: @sponsor
    end

    assert_redirected_to sponsors_path
  end
end
