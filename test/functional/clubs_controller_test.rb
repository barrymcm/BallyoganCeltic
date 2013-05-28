require 'test_helper'

class ClubsControllerTest < ActionController::TestCase
  setup do
    @club = clubs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:clubs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create club" do
    assert_difference('Club.count') do
      post :create, club: { achievements: @club.achievements, drawn: @club.drawn, goals_against: @club.goals_against, goals_for: @club.goals_for, league_id: @club.league_id, lost: @club.lost, name: @club.name, played: @club.played, won: @club.won }
    end

    assert_redirected_to club_path(assigns(:club))
  end

  test "should show club" do
    get :show, id: @club
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @club
    assert_response :success
  end

  test "should update club" do
    put :update, id: @club, club: { achievements: @club.achievements, drawn: @club.drawn, goals_against: @club.goals_against, goals_for: @club.goals_for, league_id: @club.league_id, lost: @club.lost, name: @club.name, played: @club.played, won: @club.won }
    assert_redirected_to club_path(assigns(:club))
  end

  test "should destroy club" do
    assert_difference('Club.count', -1) do
      delete :destroy, id: @club
    end

    assert_redirected_to clubs_path
  end
end
