require 'test_helper'

class PublicUsersControllerTest < ActionController::TestCase
  setup do
    @public_user = public_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:public_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create public_user" do
    assert_difference('PublicUser.count') do
      post :create, public_user: { address_1: @public_user.address_1, address_2: @public_user.address_2, county: @public_user.county, email: @public_user.email, first_name: @public_user.first_name, hashed_password: @public_user.hashed_password, last_name: @public_user.last_name, phone: @public_user.phone, salt: @public_user.salt, town: @public_user.town, username: @public_user.username }
    end

    assert_redirected_to public_user_path(assigns(:public_user))
  end

  test "should show public_user" do
    get :show, id: @public_user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @public_user
    assert_response :success
  end

  test "should update public_user" do
    put :update, id: @public_user, public_user: { address_1: @public_user.address_1, address_2: @public_user.address_2, county: @public_user.county, email: @public_user.email, first_name: @public_user.first_name, hashed_password: @public_user.hashed_password, last_name: @public_user.last_name, phone: @public_user.phone, salt: @public_user.salt, town: @public_user.town, username: @public_user.username }
    assert_redirected_to public_user_path(assigns(:public_user))
  end

  test "should destroy public_user" do
    assert_difference('PublicUser.count', -1) do
      delete :destroy, id: @public_user
    end

    assert_redirected_to public_users_path
  end
end
