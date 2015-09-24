class Customer < ActiveRecord::Base
  attr_accessor :remember_token

  before_save :downcase_email

  validates :first_name, presence: true, length: {maximum: 200}
  validates :last_name, presence: true, length: {maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 255}, format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  has_secure_password
  validates :password, presence: true, length: { in: 6..20 }, allow_nil: true
  validates :mobile, presence: true, length: {maximum: 10}
  validates :address, presence: true
  validates :country, presence: true
  validates :city, presence: true
  validates :pincode, presence: true
  validates :date_of_birth, presence: true

  def Customer.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def Customer.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = Customer.new_token
    update_attribute(:remember_digest, Customer.digest(remember_token))
  end

  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  def forget
    update_attribute(:remember_digest, nil)
  end

  def downcase_email
    self.email = email.downcase
  end

end
