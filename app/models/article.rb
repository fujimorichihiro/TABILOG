class Article < ApplicationRecord
  belongs_to :user

  has_many :article_images, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favolites, dependent: :destroy

  has_many :tags

# いいね用メソッド
  def favolited_by?(user)
    favolites.where(user_id: user.id).exists?
  end
end
