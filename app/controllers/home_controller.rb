class HomeController < ApplicationController
  skip_before_action :authenticate_user!

  def top
    @articles = Article.page(params[:page]).per(8).reverse_order
    @comment = Comment.new
  end

  def map ##現在値周辺の記事取得
    latitude = params[:latitude].to_f #javascriptから現在地データ受け取り
    longitude = params[:longitude].to_f #javascriptから現在地データ受け取り
    articles = Article.within_box(6.21371, latitude, longitude).joins(:stocks).where(stocks: {user_id: current_user}) #周辺のストック記事取得
    gon.articles = Article.within_box(6.21371, latitude, longitude) - articles
    gon.stocks = Article.joins(:stocks).where(stocks: {user_id: current_user}) #ストック記事取得
    gon.latlng = [latitude, longitude] # Mapに現在地受け渡し
    @articles = Article.within_box(6.21371, latitude, longitude) #6.21371マイル = 10km
  end
end
