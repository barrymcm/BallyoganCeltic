require 'digest/sha2'
class PublicUser < ActiveRecord::Base
  attr_accessible :address_1, :address_2, :county, :email,
                  :first_name, :last_name, :phone, :town,
                  :username, :user_password

  attr_protected :hashed_password, :salt

  attr_accessor :user_password

  PHONE_REGEX = /^[\d()\s]{5,15}$/i
  validates :phone, uniqueness: true,
            :presence => true,
            :format => PHONE_REGEX
  validates :first_name, :length =>  { maximum: 25}
  validates :last_name, :length =>  { maximum: 25}
  validates :username, uniqueness: true, presence: true

  EMAIL_REGEX = /^[\w.-]+@[\w.-]+\.[a-zA-Z]{2,4}$/i
  validates :email, :presence => true,
            :length => {:maximum => 100},
            :confirmation => true,
            :format => EMAIL_REGEX

  # has_many :comments
  # has_many :orders

  validates_length_of :user_password, :within => 6..20, on: :create

  before_save :hash_the_password
  after_save :destroy_password

  # These methods may be put into a module
  def self.check_login_details(username="", user_password="")
    PublicUser.exists?(username)
    public_user = PublicUser.find_by_username(username)
    if public_user and public_user.check_password?(user_password)
      return public_user
    else
      return false
    end
  end

  def check_password?(user_password="")
    PublicUser.salt_password(user_password, salt) == hashed_password
  end

  def self.salt(username="")
    Digest::SHA2.hexdigest("encrypt this #{username} with #{Time.now}")
  end

  def self.salt_password(user_password="", salt="")
    Digest::SHA2.hexdigest("#{salt} will make the #{user_password} uncrackable")
  end

  # Cannot be called from outside the PublicUser class
  private

  def hash_the_password
    unless user_password.blank?
      self.salt = PublicUser.salt(username) if salt.blank?
      self.hashed_password = PublicUser.salt_password(user_password, salt)
    end
  end

  def destroy_password
    self.user_password = nil
  end

end
