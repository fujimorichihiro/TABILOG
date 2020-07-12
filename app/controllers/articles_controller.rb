class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!, only: ["show", "index"]
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id
    tag_list = params[:tags].split(",")
    if @article.save
      @article.save_tags(tag_list)
      redirect_to article_path(@article)
    else
      render "new"
    end
  end

  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
  end

  def index
    option = params[:option]
    if option == "2"
      @search_title = params[:search]
      @articles = Article.search_title(params[:search]).page(params[:page]).per(20).reverse_order
    else
      @search_tag = params[:search]
      @articles = Article.search_tag(params[:search]).page(params[:page]).per(20).reverse_order
    end
  end

  def edit
    @article = Article.find(params[:id])
    @tag_list = @article.tags.pluck(:name).join(",")
  end

  def update
    @article = Article.find(params[:id])
    tag_list = params[:tags].split(",")
    if @article.update(article_params)
      @article.save_tags(tag_list)
      redirect_to article_path(@article)
    else
     render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash[:notice] = "#{@article.title}を削除しました"
    redirect_to user_path(current_user)
  end

  private
  def article_params
    params.require(:article).permit(:title, :body, :article_image, :address)
  end
end
