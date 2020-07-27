// 記事詳細ページのマップ (articles/show.html.erb , id: #map )
 $(document).ready(function initMap(){
  var article_LatLng = {lat: gon.article.latitude , lng: gon.article.longitude };
  let article_map = new google.maps.Map(document.getElementById('map'), {
  center: {lat: gon.article.latitude , lng: gon.article.longitude },
  zoom: 16
  });
  // article_mapの位置にマーカーを表示する
  marker = new google.maps.Marker({
    position: article_LatLng,
    map: article_map
  });
});



