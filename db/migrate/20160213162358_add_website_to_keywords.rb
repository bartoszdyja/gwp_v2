class AddWebsiteToKeywords < ActiveRecord::Migration
  def change
    add_reference :keywords, :website, index: true, foreign_key: true
  end
end
