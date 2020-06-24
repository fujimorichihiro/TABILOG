class ArticlesController < ApplicationController
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
  end

  def edit
  end

  def index
    followings = current_user.following
    @articles = Article.where(user_id: followings)
  end

  private
  def article_params
    params.require(:article).permit(:title, :body)
  end
end
