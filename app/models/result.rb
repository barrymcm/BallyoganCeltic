class Result < ActiveRecord::Base
  attr_accessible :away_score, :away_team, :date, :home_score, :home_team, :league_id, :location

  validates_presence_of :away_score, :away_team, :date, :home_score, :home_team, :league_id, :location

  belongs_to :league
  belongs_to :team

  scope :search_result, lambda{|home_team, away_team|
    where(["home_team => ? OR away_team => ?",
           "#{home_team}, #{away_team}"])}

  scope :sort_snr, where(:league_id => 0)
  scope :sort_17s, where(:league_id => 1)
  scope :sort_15s, where(:league_id => 2)
  scope :sort_12s, where(:league_id => 3)

  # Look at putting this into a module
  scope :sort_by_date, order('date DESC')

end
