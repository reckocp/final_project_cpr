class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string
    add_column :users, :address, :string
    add_column :users, :party, :string
  end
end
