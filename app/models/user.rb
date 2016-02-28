class User < ActiveRecord::Base
  has_secure_password
  validates :email, :first_name, :last_name, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}, uniqueness: true
  validates :password, length: { minimum: 6 }, allow_nil: true
  before_save :upcase_credentials

  has_many :accounts

  private

  def upcase_credentials
    [first_name, last_name].compact.map(&:capitalize!)
  end

end
