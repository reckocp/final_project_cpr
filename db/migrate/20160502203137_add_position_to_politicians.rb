class AddPositionToPoliticians < ActiveRecord::Migration
  def change
    add_column :politicians, :position, :string
  end
end
