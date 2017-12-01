
var applyLocation, lat_field, lng_field, marker, markersArray;
    markersArray = [];
    marker = null;
    lat_field = document.getElementById('place_latitude');
    lng_field = document.getElementById('place_longitude');
    window.initMap = function() {
      var map, mapOptions;
      var a = document.getElementsByTagName("div")
      if (a.main) {
        mapOptions = {
          center: new google.maps.LatLng(41.66085, -91.53054),
          zoom: 19,
          streetViewControl: false,
          panControl: false,
          mapTypeId: google.maps.MapTypeId.ROADMAP,
          zoomControlOptions: {
            style: google.maps.ZoomControlStyle.SMALL
          },
          mapTypeControlOptions: {
            mapTypeIds: [google.maps.MapTypeId.ROADMAP, 'map_style']
          }
        };
        map = new google.maps.Map(document.getElementById("map"), mapOptions);
        return marker = new google.maps.Marker({
          map: map,
          position: new google.maps.LatLng(41.66085, -91.53054)
        });
      }
    };
    applyLocation = function(location) {
      return marker.setPosition(new google.maps.LatLng(location.coords.latitude, location.coords.longitude));
    };
    document.addEventListener("DOMContentLoaded", function(event) { 
      return setInterval(function() {
        return navigator.geolocation.getCurrentPosition(applyLocation);
      }, 1000);
    });
    