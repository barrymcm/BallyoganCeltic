class Player < ActiveRecord::Base
  attr_accessible :achievements, :description, :dob, :first_name, :goals,
                  :last_name, :played, :position, :red_cards, :squad_number,
                  :team_id, :yellow_cards, :image_url, :email, :phone

  PHONE_REGEX = /^[\d()\s]{5,15}$/i
  validates :phone, uniqueness: true,
            :format => PHONE_REGEX
  validates :team_id, :position, :squad_number, :dob, presence: true
  validates :description, :length => { maximum: 500 }, presence: true
  validates :first_name, :length =>  { maximum: 25}
  validates :last_name, :length =>  { maximum: 25}

  EMAIL_REGEX = /^[\w_.-]+@[\w_.-]+\.[a-zA-Z]{2,4}$/i
  validates :email, :presence => true,
            :length => {:maximum => 100},
            :format => EMAIL_REGEX

  validates :image_url, allow_blank: true, format: {
      with: %r{\.(gif|jpg|png)\Z}i,
      message: "The image must be a .gif, .jpg or .png file"
  }

  has_one :team

  def players_name
    "#{first_name} #{last_name}"
  end

  scope :sort_17s, where(:team_id => 1)

  scope :top_scorers, order("goals DESC")

end
