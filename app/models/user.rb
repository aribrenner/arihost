class User < ActiveRecord::Base

  def self.find_from_credentials(username:, password:)
    user = find_by_username(username)
    return unless user
    user if user.is_password?(password)
  end

  def is_password?(password_attempt)
    BCrypt::Password.new(password_digest).is_password?(password_attempt)
  end

  def password=(new_password)
    self.password_digest = BCrypt::Password.create(new_password)
  end
  
end
