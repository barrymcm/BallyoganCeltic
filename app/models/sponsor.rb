class Sponsor < ActiveRecord::Base
  attr_accessible :company_name, :email, :first_name, :last_name,
                  :location, :package, :phone, :title

  PHONE_REGEX = /^[\d()\s]{5,15}$/i
  validates :phone, :presence => true, format: PHONE_REGEX

  EMAIL_REGEX = /^[\w_.-]+@[\w_.-]+\.[a-zA-Z]{2,4}$/i
  validates :email, presence: true, format: EMAIL_REGEX

  validates :company_name, :location, :package, :presence => true

  validates :first_name, :length => {:maximum => 25}, presence: true
  validates :last_name, :length => {:maximum => 25}, presence: true
  validates :title, :length => {:maximum => 25}, presence: true

  def sponsor
    "#{company_name}"
  end

end
