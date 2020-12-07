class ChangeDatatypeCheckedStatusOfMessageNotification < ActiveRecord::Migration[5.2]
  def change
    change_column :message_notifications, :checked_status, :integer
  end
end
