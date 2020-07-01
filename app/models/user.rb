class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

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

# フォロー用メソッド--------------------------------------------------------------------

  def follow(other_user)
    following << other_user
    make_notification(other_user)
  end

  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  def following?(other_user)
    following.include?(other_user)
  end

  def make_notification(following)
    Notification.create(receiver_id: following.id,
                        sender_id: self.id,
                        notification_type: 2
                        )
  end

end
