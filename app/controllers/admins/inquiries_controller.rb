class Admins::InquiriesController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :authenticate_admin!
  def show
  	@inquiry = Inquiry.find(params[:id])
  end

  def index
  	@inquiries = Inquiry.page(params[:page]).per(10).reverse_order
  end
end
