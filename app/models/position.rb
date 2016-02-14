class Position < ActiveRecord::Base
  belongs_to :keywordoo

  def formatted_rank
    /\A\d+\z/.match(rank) ? rank.to_i+1 : rank
  end
end
