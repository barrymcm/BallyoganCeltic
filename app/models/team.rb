class Team < ActiveRecord::Base
  attr_accessible :achievements, :drawn, :goals_against,
                  :goals_for, :league_id, :lost, :name, :played, :won

  validates  :drawn, :goals_against, :goals_for, :league_id, :lost,
             :name, :played, :won, presence: true

  belongs_to :league
  has_one :manager
  has_many :players
  has_many :fixtures
  has_many :results
  has_many :training_sessions

  scope :sort_team_snr, where(:id => 1)
  scope :sort_team_17s, where(:id => 2)
  scope :sort_team_15s, where(:id => 3)
  scope :sort_team_12s, where(:id => 4)

end
