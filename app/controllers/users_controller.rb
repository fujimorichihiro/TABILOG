class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: ["show", "following", "follower"]

  def show #userページ
    @user = User.find(params[:id])
    @articles = Article.where(user_id: params[:id]).page(params[:page]).per(4).reverse_order
    gon.articles = Article.where(user_id: params[:id])
  end

  def edit #プロフィール編集
    @user = User.find(params[:id])
    if @user == current_user
      render 'edit'
    else
      redirect_to user_path(current_user)
    end
  end

  def update #プロフィール編集
    user = User.find(params[:id])
    if user.update(user_params)
      redirect_to user_path(user)
    else
      render 'edit'
    end
  end

  def following #フォロー一覧
    @user = User.find(params[:id])
  end

  def follower #フォロワー一覧
    @user = User.find(params[:id])
  end

  def favolite #いいね記事一覧
    @favolite_articles = Article.joins(:favolites).where(favolites: {user_id: current_user}).page(params[:page]).per(10).reverse_order
    gon.favolites = Article.joins(:favolites).where(favolites: {user_id: current_user})
  end

  def stock #ストック記事一覧
    search_word = params[:search]
    if search_word
      @stock_articles = Article.joins(:stocks).where(stocks: {user_id: current_user}).where("title LIKE?", "%#{search_word}%").page(params[:page]).per(5).reverse_order
    else
      @stock_articles = Article.joins(:stocks).where(stocks: {user_id: current_user}).page(params[:page]).per(5).reverse_order
    end
    gon.stocks = @stock_articles
  end

  def timeline #タイムライン
    followings = current_user.following
    @articles = Article.where(user_id: followings) + Article.where(user_id: current_user.id) #フォロワーの投稿＋自分の投稿
    @articles = Kaminari.paginate_array(@articles).page(params[:page]).per(10).reverse
  end

  def gallery
  end

  def notifications #通知一覧
    @notifications = current_user.receive_notifications.page(params[:page]).per(10).reverse_order
    render 'notifications'
    @notifications.each do |notification| #viewを表示後、通知を全て確認済に更新
      notification.update(checked_status: 1)
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
