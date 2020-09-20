class Admins::InquiriesController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :authenticate_admin!
  def show
  	@inquiry = Inquiry.find(params[:id])
  end

  def index
    @search_number = params[:search]
    if @search_number ##未対応 or 対応済のみ表示
      @inquiries = Inquiry.where(status: params[:search]).page(params[:page]).per(10).reverse_order
    else #全件表示
  	  @inquiries = Inquiry.page(params[:page]).per(10).reverse_order
    end
  end

  def update
    @inquiry = Inquiry.find(params[:id])
    @inquiry.update(inquiry_params)
    render 'admins/inquiries/update'
  end

  private
  def inquiry_params
    params.require(:inquiry).permit(:status)
  end
end
