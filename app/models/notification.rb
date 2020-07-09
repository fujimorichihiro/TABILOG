class Notification < ApplicationRecord
  belongs_to :receiver, class_name: "User"
  belongs_to :sender, class_name: "User"
  belongs_to :article, optional: true

  enum notification_type: { 'いいね':0 ,'コメント':1 ,'フォロー':2, 'ストック':3 }
  enum checked_status: { '未確認':0 ,'確認済み':1 }
  attribute :checked_status, :integer, default: 0

  # 未確認の通知をカウント
  def self.not_checked_number
  	self.where(checked_status: 0).count
  end
end
