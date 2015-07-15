  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  attr_accessor :remember_token

  validates :password, presence: true, length: { minimum: 6 }
  validates :telephone, uniqueness: true, presence: true, numericality: { only_integer: true }, presence: true, length: { minimum: 9, maximum: 9 }
  validates :name, presence: true, length: { minimum: 4, maximum: 30 }, format: { with: /^[\w\s-]*/u, multiline: true,
                                                                                  message: 'only allows letters'}
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_many :valorations, dependent: :destroy
  has_secure_password

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def User.new_token
    SecureRandom.urlsafe_base64
  end
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end
  def forget
    update_attribute(:remember_digest, nil)
  end


end
