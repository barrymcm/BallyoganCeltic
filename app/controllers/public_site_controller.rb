class PublicSiteController < ApplicationController

  layout "public_layout"

  before_filter :league_title
  before_filter :admin_user
  before_filter :contacts

  require 'json'

  def home
    # The instance variables below get the content for the summary
    # table on the home page

    #Fixtures
    # Try to compress to one line of code
    @fixtures_snr = Fixture.sort_snr
    @fixtures_17s = Fixture.sort_17s
    @fixtures_15s = Fixture.sort_15s
    @fixtures_12s = Fixture.sort_12s

    #Results
    # Try to compress to one line of code
    @results_snr = Result.sort_snr
    @results_17s = Result.sort_17s
    @results_15s = Result.sort_15s
    @results_12s = Result.sort_12s

    # Try to compress to one line of code
    #Clubs (which are used to display the league tables on the home page)
    @clubs_snr = Club.sort_snr
    @clubs_17s = Club.sort_17s
    @clubs_15s = Club.sort_15s
    @clubs_12s = Club.sort_12s

    # Try to compress to one line of code
    #League Tables
    # @league_tbl_senior = League.sort_snr
    # @league_tbl_17 = League.sort_17s
    # @league_tbl_15 = League.sort_15s
    # @league_tbl_12 = League.sort_12s

  end

  def results
    if params[:league_id].blank?
      @results = Result.sort_snr
    else
      @results = Result.where(:league_id => params[:league_id]).sort_by_date
    end
  end

  def teams
    @teams = Team.all
    # Try to compress to one line of code
    @team_snr = Team.sort_team_snr
    @team_17s = Team.sort_team_17s
    @team_15s = Team.sort_team_15s
    @team_12s = Team.sort_team_12s

    @players = Player.where(:team_id => params[:team_id])
    @managers = Manager.where(:team_id => params[:team_id])

    @games_played = Team.where(:id => params[:team_id])

    @top_scorers = Player.select("first_name, last_name, goals")
                            .where(:team_id => params[:team_id])
                            .top_scorers.limit(3)

    @achievements = Team.select("achievements").where(:id => params[:team_id])

    @team_name = Team.select("name").where(:id => params[:team_id])

    @player_award = Player.where(:achievements => "Player of the Year")

  end

  def fixtures
    @json = Location.all.to_gmaps4rails

    if params[:league_id].blank?
      @fixtures = Fixture.sort_by_date
    else
      @fixtures = Fixture.where(:league_id => params[:league_id]).sort_by_date
    end
  end

  def leagues
    if params[:league_id].blank?
      @clubs = Club.sort_snr
    else
      @clubs = Club.where(:league_id => params[:league_id])
    end

  end

  def training

    @training_notice = TrainingSession.sort_by_date

    if params[:team_id].blank?
      @training = TrainingSession.snr_training
    else
      @training = TrainingSession.where(:team_id => params[:team_id])
    end

  end

  def show
    render :home
  end

end
