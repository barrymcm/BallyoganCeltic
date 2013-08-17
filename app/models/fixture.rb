class Fixture < ActiveRecord::Base
  attr_accessible :away_team, :date, :home_team, :league_id, :location

  validates_presence_of :away_team, :date, :home_team, :league_id, :location

  belongs_to :league
  belongs_to :team

  scope :search_fixture, lambda{ |league, team|
    where(["league_id => ? AND team_id => ?",
           "#{league}, #{team}"])}

  scope :sort_snr, where(:league_id => 0)
  scope :sort_17s, where(:league_id => 1)
  scope :sort_15s, where(:league_id => 2)
  scope :sort_12s, where(:league_id => 3)

  # Look at putting this into a module
  scope :sort_by_date, order("date DESC")

end

