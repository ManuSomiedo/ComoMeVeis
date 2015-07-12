class User < ActiveRecord::Base
  validates :email, uniqueness: true
  validates :telephone, uniqueness: true, presence: true, numericality: { only_integer: true }, presence: true, length: { minimum: 9, maximum: 9 }
  validates :name, presence: true, length: { minimum: 4, maximum: 30 }, format: { with: /^[\w\s-]*/u, multiline: true,
                                                                                  message: 'only allows letters'}

  has_many :valorations, dependent: :destroy
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

end
