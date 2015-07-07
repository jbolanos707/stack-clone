class User < ActiveRecord::Base
  attr_accessor :password

  validates :email, :password, :username, :presence => true
  validates_confirmation_of :password
  validates_uniqueness_of :email
  before_save :encrypt_password
  after_create :send_signup_confirmation
  has_many :questions
  has_many :answers

  def encrypt_password
    self.password_salt = BCrypt::Engine.generate_salt
    self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
  end

  def self.authenticate(email, password)
    user = User.where(email: email).first
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  def send_signup_confirmation
    UserMailer.signup_confirmation(self).deliver_now
  end
end
