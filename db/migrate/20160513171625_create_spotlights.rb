class CreateSpotlights < ActiveRecord::Migration
  def change
    create_table :spotlights do |t|
      t.string :title
      t.string :description
      t.string :date
      t.string :url

      t.timestamps null: false
    end
  end
end
