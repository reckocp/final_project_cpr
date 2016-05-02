class CreatePoliticians < ActiveRecord::Migration
  def change
    create_table :politicians do |t|
      t.string :name
      t.string :party
      t.text :description
      t.string :served_area
      t.string :next_election
      t.references :location, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
