class AddLevelToEvents < ActiveRecord::Migration
  def change
    add_column :events, :level, :string
  end
end
