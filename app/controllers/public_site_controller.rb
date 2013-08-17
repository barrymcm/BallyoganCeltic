class PublicSiteController < ApplicationController

  include ActionView::Helpers::TextHelper
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

    @top_scorers = Player.select("first_name, last_name, goals").where(:team_id => params[:team_id]).top_scorers.limit(3)

    @achievements = Team.select("achievements").where(:id => params[:team_id])
    @team_name = Team.select("name").where(:id => params[:team_id])
    @player_award = Player.where(:achievements => "Player of the Year")

    # Highcharts - Pie chart data

    # Arrays are used to create a JSON Object
    matches = []
    team_id = []
    won = []
    lost = []
    drawn = []
    league_id = []
    total_clubs = []

    @total_clubs = Club.all

    @total_clubs.each do |c|
        total_clubs << c.league_id
    end

    # Selects the league ids of all the clubs in the clubs table
    # and stores the in an array
    club_count = total_clubs.select {|c| c }

    @team_stats = Team.where(:id => params[:team_id])

    @team_stats.each do |p|
      team_id << p.id
      won << p.won
      lost << p.lost
      drawn << p.drawn
      matches << p.played
      league_id << p.league_id
    end

    # Selects the league id of the current team selected

    # This is here because the @team_stats iterator must be run to define the
    # first value in the league_id
    club_count.keep_if {|c| c == league_id.first}

    # counts the number of clubs in the league and subtracts ballyogan from
    # so that the total number of fixtures for ballyogan can be calculated.
    # Ballyogan plays every team in the league 2 times so 2 * number of clubs in
    # the league gives the total fixtures
    total_fixtures = club_count.count - 1

    # Creates a dynamic JSON Object %>
    @season_totals = "{ \"team_id\": #{team_id},
                        \"won\": #{won},
                        \"lost\": #{lost},
                        \"drawn\": #{drawn},
                        \"matches_played\": #{matches},
                        \"league_id\": #{league_id},
                        \"total_fixtures\": #{total_fixtures * 2}
                       }"

    # Highcharts - Bar chart data

    # Arrays are used to create a JSON Object
    fnames = []
    lnames = []
    goals = []

    @top_scorers.each do |t|
      fnames << truncate(t.first_name, length: 2, omission: ".")
      lnames << t.last_name
      goals << t.goals
    end

    # Creates a dynamic JSON Object
    @top_scorer = "{ \"first_names\" : #{fnames},
                     \"last_names\" : #{lnames},
                     \"goals\" : #{goals}
                   }"

  end

  def fixtures
    @json = Location.all.to_gmaps4rails

    if params[:league_id].blank?
      # Default setting for fixture displays
      @fixtures = Fixture.sort_snr.sort_by_date
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
