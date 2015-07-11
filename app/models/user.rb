class User < ActiveRecord::Base

  attr_accessor :new_password, :new_password_confirmation
  validates :new_password, presence: true
  validates :new_password_confirmation, presence:true
  validates_confirmation_of :new_password, if: :password_changed?

  validates :telephone, uniqueness: true, presence: true, numericality: { only_integer: true }, presence: true, length: { minimum: 9, maximum: 9 }
  validates :name, presence: true, length: { minimum: 4, maximum: 30 }, format: { with: /^[\w\s-]*/u, multiline: true,
                                                                                  message: 'only allows letters'}
  before_save :hash_new_password, if: :password_changed?

  has_many :valorations, dependent: :destroy
  def password_changed?
    !@new_password.blank?
  end

  private

    def hash_new_password
    self.hashed_password = BCrypt::Password.create(@new_password)
    end

end
