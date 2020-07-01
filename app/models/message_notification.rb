class MessageNotification < ApplicationRecord
  belongs_to :receiver, class_name: "User"
  belongs_to :sender, class_name: "User"
  belongs_to :room

  enum checked_status: { '未確認':0 ,'確認済み':1 }
  attribute :checked_status, :integer, default: 0
end
