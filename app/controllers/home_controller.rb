class HomeController < ApplicationController
  skip_before_action :authenticate_user!

  def top
    @articles = Article.page(params[:page]).per(8).reverse_order
    @comment = Comment.new
  end

  def map
    latitude = params[:latitude].to_f
    longitude = params[:longitude].to_f
    gon.articles = Article.within_box(6.21371, latitude, longitude)
    gon.latlng = [latitude, longitude]
    @articles = Article.within_box(6.21371, latitude, longitude)
  end

end
