class Keyword < ActiveRecord::Base
  belongs_to :website
  has_many :positions, dependent: :destroy

  after_commit :check_position

  # private

  def check_position
    response = hit_google(website.url, phrase)
    positions.create(rank: response[:rank], links: response[:links])
  end

  def hit_google(website, keyword)
    conn = Faraday.get("https://www.googleapis.com/customsearch/v1?q=#{keyword}&cx=#{ENV['secret_google_cx']}&key=#{ENV['secret_google_key']}")
    p conn.status
    if conn.status == 200
      response = JSON.parse(conn.body)['items']
      return 'Error! Nothing found' if response.blank?
      links = response.map { |item| URI.parse(item['link']).host}
      rank = links.find_index(URI.parse(website).host) || 'Not in the first 10'
      {rank: rank, links: links[0..rank-1]}
    else
      {rank: 'Daily limit exceeded.'}
    end
  end
end
