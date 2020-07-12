$(function(){
  $('#getposition').on('click',function initMap() {
    $('#loading-filter').css('display','block');
    navigator.geolocation.getCurrentPosition(
      function(position) {
        window.location.href = "/map?latitude="+position.coords.latitude+"&longitude="+position.coords.longitude
      }
    );
  });
});

