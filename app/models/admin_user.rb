require 'digest/sha2'
class AdminUser < ActiveRecord::Base
  attr_accessible :email, :first_name, :image, :last_name,
                  :phone, :position, :username, :password

  attr_protected :hashed_password, :salt

  attr_accessor :password

  # Need to find all the relationships that an admin user will have
  has_many :expenses

  EMAIL_REGEX = /^[\w.-]+@[\w.-]+\.[a-zA-Z]{2,4}$/i
  validates :first_name, presence: true, :length => {maximum: 25}
  validates :last_name, presence: true, :length => {maximum: 25}
  validates :username, :length => {within: 4..25}, uniqueness: true
  validates :email, :presence => true,
            :length => {:maximum => 100},
            :confirmation => true,
            :format => EMAIL_REGEX

  validates_length_of :password, :within => 6..20, on: :create

  # callback methods
  before_save :hash_the_password
  after_save :destroy_password

  def self.check_login_details(username="", password="")
    AdminUser.exists?(username)
      admin_user = AdminUser.find_by_username(username)
    if admin_user and admin_user.check_password?(password)
      return admin_user
    else
      return false
    end
  end

  def check_password?(password="")
    AdminUser.salt_password(password, salt) == hashed_password
  end

  def self.salt(username="")
    Digest::SHA2.hexdigest("encrypt this #{username} with #{Time.now}")
  end

  def self.salt_password(password="", salt="")
    Digest::SHA2.hexdigest("#{salt} will make the #{password} uncrackable")
  end

  # Cannot be called from outside the AdminUser class
  private

  def hash_the_password
    unless password.blank?
      self.salt = AdminUser.salt(username) if salt.blank?
      self.hashed_password = AdminUser.salt_password(password, salt)
    end
  end

  def destroy_password
    self.password = nil
  end

end
