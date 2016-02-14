class AddAccountToWebsites < ActiveRecord::Migration
  def change
    add_reference :websites, :account, index: true, foreign_key: true
  end
end
