class FavolitesController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    favolite = Favolite.create!({user_id: current_user.id, article_id: @article.id})
    @id_name = "#favolite-#{@article.id}"
    render "articles/favolite"
  end

  def destroy
    @article = Article.find(params[:article_id])
    favolite = current_user.favolites.find_by(article_id: @article.id)
    favolite.destroy
    @id_name = "#favolite-#{@article.id}"
    render "articles/unfavolite"
  end
end
