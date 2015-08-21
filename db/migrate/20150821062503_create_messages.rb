class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :body
      t.references :reply_to, index: true

      t.datetime :created_at, null: false
    end
  end
end
