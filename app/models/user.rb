class User < ActiveRecord::Base
  include BCrypt

  has_many :request_records

    def self.from_omniauth(auth)
      find_by_provider_and_uid(auth["provider"], auth["uid"]) || create_with_omniauth(auth)
    end

    def self.create_with_omniauth(auth)
      create! do |user|
        user.provider = auth["provider"]
        user.uid = auth["uid"]
        user.name = auth["info"]["name"]
    end
  end

  # def password
  #   @password ||= Password.new(password_hash)
  # end

  # def password=(pass)
  #   @password = pass
  #   self.password_hash = Password.create(pass)
  # end

  # def self.authenticate(user_info)
  #   user = User.find_by_username(user_info[:username])
  #   return user if user && user.password == user_info[:password]
  # end
end
