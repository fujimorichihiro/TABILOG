class Api::V1::ArticlesController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    @articles = Article.where(user_id: 102)
  end

  def show
    @article = Article.find(params[:id])
  end
end