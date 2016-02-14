class Website < ActiveRecord::Base
  belongs_to :account
  has_many :keywords
  validates :name, :url, presence: true
  validate :check_url

  def check_url
    errors.add(:url, 'I cannot connect to this URL') unless check_status < 400
  end

  def check_status
    self.url = "http://#{url}" unless url[/\Ahttp:\/\//] || url[/\Ahttps:\/\//]
    begin
      Faraday.head(url).status
    rescue Faraday::Error::ConnectionFailed
      500
    end
  end
end
