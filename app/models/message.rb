class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room

  def make_notification
  	notification = MessageNotification.new(room_id: self.room_id,
                                    sender_id: self.user_id)
  	other_entries = self.room.entries.where.not(user_id: self.user_id)
  	other_entries.each do |entry|
  	  notification.receiver_id = entry.user_id
  	end
  	notification.save
  end

end
