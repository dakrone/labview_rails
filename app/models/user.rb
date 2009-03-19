require 'digest/sha1'
class User < ActiveRecord::Base
  validates_presence_of :username
  validates_uniqueness_of :username
  validates_presence_of :password

  def password=(pwd)
    write_attribute('password', Digest::SHA1.hexdigest(pwd))
  end

  def self.authenticate(username, password)
    hashed_password = Digest::SHA1.hexdigest(password)
    user = self.find_by_username_and_password(username, hashed_password)
    return user
  end
end
