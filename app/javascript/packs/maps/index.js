document.addEventListener("turbolinks:load", function() {

  var user_location = JSON.parse(document.querySelector('#map').dataset.location);
  window.user_location = user_location;

  var map = new GMaps({
    div: '#map',
    zoom: 12,
    lat: user_location.latitude,
    lng: user_location.longitude,
    disableDefaultUI: true,
    scrollwheel: false
  });

  window.map = map;

});
