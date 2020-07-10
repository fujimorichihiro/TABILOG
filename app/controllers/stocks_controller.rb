class StocksController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    if stock = Stock.create!({user_id: current_user.id, article_id: @article.id})
      stock.make_notification
    end
    @id_name = "#stock-#{@article.id}"
    render "articles/stock"
  end

  def destroy
    @article = Article.find(params[:article_id])
    stock = current_user.stocks.find_by(article_id: @article.id)
    stock.destroy
    @id_name = "#stock-#{@article.id}"
    render "articles/unstock"
  end
end
