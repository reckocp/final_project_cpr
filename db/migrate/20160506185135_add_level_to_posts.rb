class AddLevelToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :level, :string
  end
end
