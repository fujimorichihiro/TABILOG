class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: ["show", "following", "follower"]
  def show
    @user = User.find(params[:id])
  end


  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render 'edit'
    else
      redirect_to user_path(current_user)
    end
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)

    redirect_to user_path(user)
  end

  def following
    @user = User.find(params[:id])
  end

  def follower
    @user = User.find(params[:id])
  end

  def favolite
    @favolite_articles = Article.joins(:favolites).where(favolites: {user_id: current_user})
  end

  def timeline
    followings = current_user.following
    @articles = Article.where(user_id: followings)
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
