class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :omniauthable, omniauth_providers: %i[twitter google_oauth2]

  attachment :profile_image

# association---------------------------------------------------------------------

  has_many :active_relationships, class_name: "Relationship",
                                  foreign_key: "follower_id",
                                  dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship",
                                   foreign_key: "followed_id",
                                   dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  has_many :articles, dependent: :destroy

  has_many :messages, dependent: :destroy

  has_many :comments, dependent: :destroy

  has_many :favolites, dependent: :destroy

  has_many :entries, dependent: :destroy

  has_many :receive_notifications, class_name: "Notification",
                                   foreign_key: "receiver_id",
                                   dependent: :destroy
  has_many :send_notifications, class_name: "Notification",
                                   foreign_key: "sender_id",
                                   dependent: :destroy

  has_many :message_receives, class_name: "MessageNotification",
                                   foreign_key: "receiver_id",
                                   dependent: :destroy
  has_many :message_sends, class_name: "MessageNotification",
                                   foreign_key: "sender_id",
                                   dependent: :destroy
# バリデーション
  validates :name, presence: true, length: { maximum: 20 }
# SNS認証用コールバックメソッド
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.confirmed_at = Time.current
    end
  end

# フォロー用メソッド--------------------------------------------------------------------
  # フォローする
  def follow(other_user)
    following << other_user
    make_notification(other_user)
  end
  # フォローを外す
  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end
  # フォローしているか判定する。
  def following?(other_user)
    following.include?(other_user)
  end
  # フォロー通知を作成する。
  def make_notification(following)
    Notification.create(receiver_id: following.id,
                        sender_id: self.id,
                        notification_type: 2
                        )
  end
# 新規メッセージカウント
  def unchecked_messages_count
    self.message_receives.where(checked_status: 0).count
  end
# メッセージ相手ごとの新規メッセージ数をカウント
  def room_message_count(room)
    self.message_receives.where(room_id: room.id).where(checked_status: 0).count
  end

end
