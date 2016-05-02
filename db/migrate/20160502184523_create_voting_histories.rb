class CreateVotingHistories < ActiveRecord::Migration
  def change
    create_table :voting_histories do |t|
      t.string :bill_name
      t.text :description
      t.string :decision
      t.references :politician, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
