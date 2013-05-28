class League < ActiveRecord::Base
  attr_accessible :title

  validates :title, presence: true, uniqueness: true, :length => { maximum: 40 }

  has_many :teams
  has_many :results
  has_many :fixtures

end
