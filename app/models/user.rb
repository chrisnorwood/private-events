class User < ApplicationRecord
  attr_accessor :remember_token

  # Associations
  has_many :created_events, class_name: 'Event', foreign_key: 'creator_id'

  # Validations
  validates :name,  presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

  # Callbacks
  before_save :downcase_email

  # Remembers the user in the database, for use in persistent sessions
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  # Forget a user
  def forget
    update_attribute(:remember_digest, nil)
  end

  # Returns true if rememeber token matches digest
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  # Encrypts given token for use in digest
  def User.digest
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(token, cost: cost)
  end

  # Generates a new, random token
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  private

    def downcase_email
      email.downcase!
    end
end