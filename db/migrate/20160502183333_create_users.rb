class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :party

      t.timestamps null: false
    end
  end
end
