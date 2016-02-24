class AddLinksToPositions < ActiveRecord::Migration
  def change
    add_column :positions, :links, :string, array: true, default: []
  end
end
