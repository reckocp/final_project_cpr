class AddUseridToSpotlight < ActiveRecord::Migration
  def change
    add_column :spotlights, :user_id, :integer
  end
end
