class User < ActiveRecord::Base

  attr_accessor :new_password, :new_password_confirmation, :logged_in
  validates :new_password, presence: true, length: { minimum: 8, maximum: 30 }
  validates :new_password_confirmation, presence:true
  validates :email, uniqueness: true
  validates_confirmation_of :new_password, if: :password_changed?

  validates :telephone, uniqueness: true, presence: true, numericality: { only_integer: true }, presence: true, length: { minimum: 9, maximum: 9 }
  validates :name, presence: true, length: { minimum: 4, maximum: 30 }, format: { with: /^[\w\s-]*/u, multiline: true,
                                                                                  message: 'only allows letters'}
  before_save :hash_new_password, if: :password_changed?

  has_many :valorations, dependent: :destroy
  belongs_to :session


  def password_changed?
    !@new_password.blank?
  end


  def authenticate(telephone, password)
    if user = User.find_by_telephone(telephone)
      # Then compare the provided password against the hashed one in the db.
      if BCrypt::Password.new(user.hashed_password).is_password? password
        # If they match we return the user
        return user
      end
    end
    # If we get here it means either there's no user with that email, or the wrong
    # password was provided.  But we don't want to let an attacker know which.
    return nil
   end

  private
    def hash_new_password
      self.hashed_password = BCrypt::Password.create(@new_password)
    end
  end
