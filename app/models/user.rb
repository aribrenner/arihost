class User < ActiveRecord::Base

  PASSWORD_LENGTH_RANGE = { minimum: 6, maximum: 25 }
  USERNAME_LENGTH_RANGE = { minimum: 7, maximum: 15 }

  validates_presence_of :username
  validates :username, length: USERNAME_LENGTH_RANGE
  validates :password, length: PASSWORD_LENGTH_RANGE

  attr_reader :password

  def self.find_from_credentials(username:, password:)
    user = find_by_username(username)
    return unless user
    user if user.is_password?(password)
  end

  def is_password?(password_attempt)
    BCrypt::Password.new(password_digest).is_password?(password_attempt)
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

end
