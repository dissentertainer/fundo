document.addEventListener("turbolinks:load", function() {

  var loc = JSON.parse(document.querySelector('#map').dataset.location);
  window.loc = loc;

  // handle output from ipinfo.io results

  if (loc) {
    if (loc.latitude == undefined) {
      loc.latitude = loc.loc.split(',')[0];
    }
    if (loc.longitude == undefined) {
      loc.longitude = loc.loc.split(',')[1];
    }
  }

  var map = new GMaps({
    div: '#map',
    lat: loc.latitude,
    lng: loc.longitude,
    disableDefaultUI: true,
    scrollwheel: false
  });

  var bounds = google.maps.LatLngBounds();

  if (loc.latitude && loc.longitude) {
    var marker = map.addMarker({
      lat: loc.latitude,
      lng: loc.longitude
    });

    bounds.extend(marker.position);
  }

  map.fitBounds(bounds);
});
