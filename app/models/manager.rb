class Manager < ActiveRecord::Base
  attr_accessible :achievements, :description, :email,
                  :first_name, :last_name, :phone,
                  :team_id, :image_url

  PHONE_REGEX = /^[\d()\s]{5,15}$/i
  validates :phone, uniqueness: true,
            :format => PHONE_REGEX,
            :presence => true
  validates :team_id, presence: true
  validates :description, :length => { maximum: 500 }, presence: true
  validates :first_name, :length =>  { maximum: 25 }, presence: true
  validates :last_name, :length =>  { maximum: 25 }, presence: true

  EMAIL_REGEX = /^[\w.-]+@[\w.-]+\.[a-zA-Z]{2,4}$/i
  validates :email, :presence => true,
            :length => {:maximum => 100},
            :confirmation => true,
            :format => EMAIL_REGEX

  validates :image_url, allow_blank: true, format: {
      with: %r{\.(gif|jpg|png)\Z}i,
      message: "The image must be a .gif, .jpg or .png file"
  }

  def managers_name
    "#{first_name} #{last_name}"
  end


  belongs_to :team
end
