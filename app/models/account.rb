class Account < ActiveRecord::Base
  belongs_to :user
  has_many :websites
  validates :name, presence: true
end
