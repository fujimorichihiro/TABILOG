class SearchController < ApplicationController
  #　場所、スポット名検索
  def by_location
    @latlang = Geocoder.search(params[:search]).first.coordinates #緯度、経度を取得
    @articles = Aticle.within_box(1.24274, latlng[0], latlng[1])
  end

  # タイトル検索
  def by_title
  end

  def by_current_location
  end
end