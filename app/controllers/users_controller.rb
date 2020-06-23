class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update

  end

  def follower
  end

  def followed
  end

  private
  def user_params
    params.require(:user).prermit(:name, :introduction, :profile_iamge)
  end
end
