class Favolite < ApplicationRecord
  belongs_to :user
  belongs_to :article

# 通知作成用メソッド
  def make_notification
  	Notification.create(receiver_id: self.article.user.id,
                        sender_id: self.user_id,
                        article_id: self.article.id,
                        notification_type: 0
                        )
  end
end
