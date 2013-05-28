require 'test_helper'

class TraingSessionsControllerTest < ActionController::TestCase
  setup do
    @traing_session = traing_sessions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:traing_sessions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create traing_session" do
    assert_difference('TraingSession.count') do
      post :create, traing_session: { coach: @traing_session.coach, date: @traing_session.date, location: @traing_session.location }
    end

    assert_redirected_to traing_session_path(assigns(:traing_session))
  end

  test "should show traing_session" do
    get :show, id: @traing_session
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @traing_session
    assert_response :success
  end

  test "should update traing_session" do
    put :update, id: @traing_session, traing_session: { coach: @traing_session.coach, date: @traing_session.date, location: @traing_session.location }
    assert_redirected_to traing_session_path(assigns(:traing_session))
  end

  test "should destroy traing_session" do
    assert_difference('TraingSession.count', -1) do
      delete :destroy, id: @traing_session
    end

    assert_redirected_to traing_sessions_path
  end
end
