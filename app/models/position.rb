class Position < ActiveRecord::Base
  include ActionView::Helpers::DateHelper
  belongs_to :keyword

  def formatted_rank
    /\A\d+\z/.match(rank) ? rank.to_i+1 : rank
  end

  def formatted_creation_date
    time_ago_in_words(created_at) + ' ago'
  end
end
