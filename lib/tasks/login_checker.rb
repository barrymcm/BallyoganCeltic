=begin
def self.check_login_details(username="", password="")
  self.class.exists?(username)
  admin_user = self.class..find_by_username(username)
  if admin_user and admin_user.check_password?(password)
    return admin_user
  else
    return false
  end
end=end
