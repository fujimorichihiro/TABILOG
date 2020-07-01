class Article < ApplicationRecord
  belongs_to :user

  has_many :article_images, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favolites, dependent: :destroy

  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings

  has_many :notifications, dependent: :destroy

  attachment :article_image

# いいね用メソッド
  def favolited_by?(user)
    favolites.where(user_id: user.id).exists?
  end

# geocoder用メソッド
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
  def self.search(search_tag)
    self.joins(:tags).where(tags: {name: "#{search_tag}"})
  end
end
