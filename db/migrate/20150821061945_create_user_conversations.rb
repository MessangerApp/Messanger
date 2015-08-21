class CreateUserConversations < ActiveRecord::Migration
  def change
    create_table :user_conversations do |t|
      t.references :user, index: true, foreign_key: true
      t.references :conversation, index: true, foreign_key: true
      t.boolean :muted
      t.boolean :left

      t.timestamps null: false
    end
  end
end
