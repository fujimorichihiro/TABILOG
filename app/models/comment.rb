class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :article
  has_one :notification

  validates :body, presence: true

# 通知作成メソッド
  def make_notification
    unless self.article.user == self.user
  	  Notification.create(receiver_id: self.article.user.id,
                          sender_id: self.user_id,
                          article_id: self.article.id,
                          comment_body: self.body,
                          notification_type: 1
                          )
    end
  end
end
