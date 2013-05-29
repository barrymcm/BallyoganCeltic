class Club < ActiveRecord::Base
  attr_accessible :achievements, :drawn, :goals_against, :goals_for, :league_id, :lost, :name, :played, :won

  validates_presence_of :name, :limit => { maximum: 30 }

  scope :search_league_tables, lambda{|club_id|
    where(["club_id => ?", "#{club_id}"])}

  scope :sort_snr, where(:league_id => 1)
  scope :sort_17s, where(:league_id => 2)
  scope :sort_15s, where(:league_id => 3)
  scope :sort_12s, where(:league_id => 4)

end
