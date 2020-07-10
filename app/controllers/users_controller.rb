class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: ["show", "following", "follower"]
  def show
    @user = User.find(params[:id])
    gon.articles = Article.where(user_id: params[:id])
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
    gon.favolites = Article.joins(:favolites).where(favolites: {user_id: current_user})
  end

  def stock
    @stock_articles = Article.joins(:stocks).where(stocks: {user_id: current_user})
    gon.stocks = Article.joins(:stocks).where(stocks: {user_id: current_user})
  end

  def timeline
    followings = current_user.following
    @articles = Article.where(user_id: followings) + Article.where(user_id: current_user.id)
    @articles = Kaminari.paginate_array(@articles).page(params[:page]).per(20)
  end

  def map
    @user = User.find(params[:id])
    @articles = Article.where(user_id: @user.id)
    gon.articles = Article.where(user_id: @user.id)
    gon.stocks = Article.joins(:stocks).where(stocks: {user_id: @user})
  end

  def notifications
    @new_notifications = current_user.receive_notifications.where(checked_status: 0).reverse_order
    @checked_notifications = current_user.receive_notifications.where(checked_status: 1).reverse_order
    render 'notifications'
    @new_notifications.each do |notification|
      notification.update(checked_status: 1)
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
