class Account < ActiveRecord::Base
  belongs_to :user
  has_many :websites
  validates :name, presence: true
  validates :name, uniqueness: { scope: :user_id }
end
