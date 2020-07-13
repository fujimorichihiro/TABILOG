class Admins::UsersController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :authenticate_admin!
  def index
    @users = User.page(params[:page]).per(20)
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user =User.find(params[:id])
    redirect_to admins_user_path(@user)
  end
end
