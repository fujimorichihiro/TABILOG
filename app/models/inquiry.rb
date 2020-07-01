class Inquiry < ApplicationRecord
  enum status: { '未対応':0 ,'対応済み':1 }
  attribute :status, :integer, default: 0
end
