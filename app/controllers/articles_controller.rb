class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!, only: ["show"]
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id
    if @article.save
      redirect_to user_path(current_user)
    else
      render "new"
    end
  end

  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def index
    followings = current_user.following
    @articles = Article.where(user_id: followings)
    @comment = Comment.new
  end

  private
  def article_params
    params.require(:article).permit(:title, :body, :article_image, :address)
  end
end
