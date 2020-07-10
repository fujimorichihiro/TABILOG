class Inquiry < ApplicationRecord
  # 対応済かのステータス
  enum status: { '未対応':0 ,'対応済み':1 }
  attribute :status, :integer, default: 0
  #emailのバリデーション
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 40 },
                    format:     { with: VALID_EMAIL_REGEX }

  validates :title, presence: true, length: { maximum: 20 }
  validates :body, presence: true, length: { maximum: 300 }
end
