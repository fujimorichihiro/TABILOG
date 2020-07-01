class InquiriesController < ApplicationController
  skip_before_action :authenticate_user!

  def new
  	@inquiry = Inquiry.new
  end

  def create
  	@inquiry = Inquiry.new(inquiry_params)
  	if user_signed_in?
  	  @inquiry.email = current_user.email
  	end
  	if @inquiry.save
  	  InquiryMailer.inquiry_mail(@inquiry).deliver
  	  redirect_to user_path(current_user)
  	else
  	  render 'new'
  	end
  end

  private
  def inquiry_params
  	params.require(:inquiry).permit(:email, :body)
  end
end
