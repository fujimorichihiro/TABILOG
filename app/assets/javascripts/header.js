$(function(){
  $('#getposition').on('click',function initMap() {
    navigator.geolocation.getCurrentPosition(
      function(position) {
        window.location.href = "/users/<%= current_user.id %>/map?latitude="+position.coords.latitude+"&longitude="+position.coords.longitude
      }
    );
  });
});