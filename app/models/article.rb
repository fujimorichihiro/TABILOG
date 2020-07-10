class Article < ApplicationRecord

# アソシエーション ---------------------------------
  belongs_to :user

  has_many :article_images, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favolites, dependent: :destroy
  has_many :stocks, dependent: :destroy
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings
  has_many :notifications, dependent: :destroy

# バリデーション------------------------------------
  validates :title, presence: true, length: { maximum: 30 }
  validates :body, presence: true
  validates :address, length: { maximum: 50 }

# refile用
  attachment :article_image

# いいねしているかどうか判別
  def favolited_by?(user)
    favolites.where(user_id: user.id).exists?
  end

  def stocked_by?(user)
    stocks.where(user_id: user.id).exists?
  end

# geocoder用メソッド,address作成、変更時に緯度、経度を算出
  geocoded_by :address
  after_validation :geocode

# tag保存用メソッド
  def save_tags(tag_list)
    current_tags = self.tags.pluck(:name) unless self.tags.nil?
    old_tags = current_tags - tag_list
    new_tags = tag_list - current_tags

    # Destroy old taggings:
    old_tags.each do |old_name|
      self.tags.delete Tag.find_by(name:old_name)
    end

    # Create new taggings:
    new_tags.each do |new_name|
      article_tag = Tag.find_or_create_by(name:new_name)
      self.tags << article_tag
    end
  end

# tag検索用メソッド
  def self.search_tag(search)
    self.joins(:tags).where(tags: {name: "#{search}"})
  end

# title検索用メソッド
  def self.search_title(search)
    self.where('title LIKE ?',"%#{search}%")
  end
# 現在地周辺の記事検索用メソッド
   def self.within_box(distance, latitude, longitude)
    distance = distance
    center_point = [latitude, longitude]
    box = Geocoder::Calculations.bounding_box(center_point, distance)
    self.within_bounding_box(box)
  end

end
