function geoFindMe() {
  var output = document.getElementById(out);

  if (!navigator.geolocation){
    output.innerHTML = pGeolocation is not supported by your browserp;
    return;
  }

  function success(position) {
    var latitude  = position.coords.latitude;
    var longitude = position.coords.longitude;

    output.innerHTML = 'pLatitude is ' + latitude + '° brLongitude is ' + longitude + '°p';

    var img = new Image();
    img.src = httpsmaps.googleapis.commapsapistaticmapcenter= + latitude + , + longitude + &zoom=13&size=300x300&sensor=false;

    output.appendChild(img);
  }

  function error() {
    output.innerHTML = Unable to retrieve your location;
  }

  output.innerHTML = pLocating…p;

  navigator.geolocation.getCurrentPosition(success, error);
}