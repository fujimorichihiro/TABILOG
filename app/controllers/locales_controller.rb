class LocalesController < ApplicationController
  #言語を切り替える
  def change_locale
    session[:locale] = params[:language]
    redirect_back(fallback_location: root_path)
  end
end
