class AddLevelToSpotlight < ActiveRecord::Migration
  def change
    add_column :spotlights, :level, :string
  end
end
