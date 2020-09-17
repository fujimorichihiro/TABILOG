class Admins::HomeController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :authenticate_admin!
  def top
    # 未対応のお問い合わせ件数カウント
    @inquiry_number = Inquiry.where(status: 0).count
  end
end
