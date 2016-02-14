class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.string :rank
      t.references :keyword, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
