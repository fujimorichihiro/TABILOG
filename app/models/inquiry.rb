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

  # 未対応の問い合わせカウント
  def self.count_by_status(number)
    self.where(status: number).count
  end

  ##その日の問い合わせ件数
  def self.count_per_day
    self.where(created_at: Time.zone.today.beginning_of_day..Time.zone.now).count
  end
end
