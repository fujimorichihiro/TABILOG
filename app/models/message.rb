class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room

  def make_notification(message)
  	notification = Notification.new
  	notification.message_id = message.id
  	other_entries = message.room.entries.where.not(user_id: message.user_id)
  	other_entries.each do |entry|
  	  notification.user_id = entry.user_id
  	end
  	notification.save
  end

end
