class HomeController < ApplicationController
  skip_before_action :authenticate_user!

  def top
    @articles = Article.page(params[:page]).per(8).reverse_order
    @comment = Comment.new
  end

  def map_test
    gon.articles = Article.all
  end

end
