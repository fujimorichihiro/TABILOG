class ArticleImage < ApplicationRecord
  attachment :image

  belongs_to :article
end
