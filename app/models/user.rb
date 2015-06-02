class User < ActiveRecord::Base
  include BCrypt

  has_many :request_records

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(pass)
    @password = pass
    self.password_hash = Password.create(pass)
  end

  def self.authenticate(user_info)
    user = User.find_by_username(user_info[:username])
    return user if user && user.password == user_info[:password]
  end
end
