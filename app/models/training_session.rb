class TrainingSession < ActiveRecord::Base

  attr_accessible :coach, :date, :location, :notes, :team_id

  validates_presence_of :coach, :location, :team_id, :date

  belongs_to :team

  scope :snr_training, where(:team_id => 0)

  scope :sort_by_date, order('date DESC')

end
