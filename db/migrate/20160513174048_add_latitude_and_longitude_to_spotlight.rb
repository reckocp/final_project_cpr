class AddLatitudeAndLongitudeToSpotlight < ActiveRecord::Migration
  def change
    add_column :spotlights, :latitude, :float
    add_column :spotlights, :longitude, :float
  end
end
