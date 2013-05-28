require 'test_helper'

class ManagersControllerTest < ActionController::TestCase
  setup do
    @manager = managers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:managers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create manager" do
    assert_difference('Manager.count') do
      post :create, manager: { achievements: @manager.achievements, description: @manager.description, email: @manager.email, first_name: @manager.first_name, last_name: @manager.last_name, phone: @manager.phone, team_id: @manager.team_id }
    end

    assert_redirected_to manager_path(assigns(:manager))
  end

  test "should show manager" do
    get :show, id: @manager
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @manager
    assert_response :success
  end

  test "should update manager" do
    put :update, id: @manager, manager: { achievements: @manager.achievements, description: @manager.description, email: @manager.email, first_name: @manager.first_name, last_name: @manager.last_name, phone: @manager.phone, team_id: @manager.team_id }
    assert_redirected_to manager_path(assigns(:manager))
  end

  test "should destroy manager" do
    assert_difference('Manager.count', -1) do
      delete :destroy, id: @manager
    end

    assert_redirected_to managers_path
  end
end
