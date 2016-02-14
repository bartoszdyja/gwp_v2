class User < ActiveRecord::Base
  has_secure_password
  validates :email,:first_name, :last_name, :password, :password_confirmation, presence: true
  validates :password, length: { minimum: 6 }
  before_save :upcase_credentials

  has_many :accounts

  private

  def upcase_credentials
    [first_name, last_name].map(&:capitalize!)
  end
end
