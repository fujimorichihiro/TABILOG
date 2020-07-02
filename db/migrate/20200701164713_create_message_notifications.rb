class CreateMessageNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :message_notifications do |t|
      t.integer :receiver_id
      t.integer :sender_id
      t.integer :room_id
      t.string :checked_status
      t.string :integer

      t.timestamps
    end
  end
end
