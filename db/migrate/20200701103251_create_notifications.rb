class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.integer :receiver_id, null: false
      t.integer :sender_id, null: false
      t.integer :article_id
      t.text :comment_body
      t.integer :notification_type, null: false
      t.integer :checked_status, null: false

      t.timestamps
    end
  end
end
