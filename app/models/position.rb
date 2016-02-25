class Position < ActiveRecord::Base
  include ActionView::Helpers::DateHelper
  validates :rank, presence: true
  belongs_to :keyword

  def formatted_rank
    /\A\d+\z/.match(rank) ? rank.to_i+1 : rank
  end


end
