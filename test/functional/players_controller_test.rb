require 'test_helper'

class PlayersControllerTest < ActionController::TestCase
  setup do
    @player = players(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:players)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create player" do
    assert_difference('Player.count') do
      post :create, player: { achievements: @player.achievements, description: @player.description, dob: @player.dob, first_name: @player.first_name, goals: @player.goals, last_name: @player.last_name, played: @player.played, position: @player.position, red_cards: @player.red_cards, squad_number: @player.squad_number, team_id: @player.team_id, yellow_cards: @player.yellow_cards }
    end

    assert_redirected_to player_path(assigns(:player))
  end

  test "should show player" do
    get :show, id: @player
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @player
    assert_response :success
  end

  test "should update player" do
    put :update, id: @player, player: { achievements: @player.achievements, description: @player.description, dob: @player.dob, first_name: @player.first_name, goals: @player.goals, last_name: @player.last_name, played: @player.played, position: @player.position, red_cards: @player.red_cards, squad_number: @player.squad_number, team_id: @player.team_id, yellow_cards: @player.yellow_cards }
    assert_redirected_to player_path(assigns(:player))
  end

  test "should destroy player" do
    assert_difference('Player.count', -1) do
      delete :destroy, id: @player
    end

    assert_redirected_to players_path
  end
end
