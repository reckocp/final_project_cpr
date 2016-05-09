class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :body
      t.integer :conversation_id, index: true
      t.integer :user_id, index: true
      t.boolean :read, :default => false

      t.timestamps null: false
    end
  end
end
