class Article < ApplicationRecord
  belongs_to :user

  has_many :article_images, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favolites, dependent: :destroy

  has_many :tags
end
