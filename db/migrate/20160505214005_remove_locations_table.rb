class RemoveLocationsTable < ActiveRecord::Migration
  def change
    remove_reference(:locations, :user, index: true, foreign_key: true)
    remove_reference(:politicians, :location, index: true, foreign_key: false)
    remove_reference(:posts, :location, index: true, foreign_key: true)

    drop_table :locations
  end
end
