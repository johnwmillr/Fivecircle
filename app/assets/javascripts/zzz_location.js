

// function geoFindMe() {
//   var output = document.getElementById(out);

//   if (!navigator.geolocation){
//     output.innerHTML = pGeolocation is not supported by your browserp;
//     return;
//   }

//   function success(position) {
//     var latitude  = position.coords.latitude;
//     var longitude = position.coords.longitude;

//     output.innerHTML = 'pLatitude is ' + latitude + '° brLongitude is ' + longitude + '°p';

//     var img = new Image();
//     img.src = httpsmaps.googleapis.commapsapistaticmapcenter= + latitude + , + longitude + &zoom=13&size=300x300&sensor=false;

//     output.appendChild(img);
//   }

//   function error() {
//     output.innerHTML = Unable to retrieve your location;
//   }

//   output.innerHTML = pLocating…p;

//   navigator.geolocation.getCurrentPosition(success, error);
// }

window.onload = function() {
    var table = document.getElementById("pins");
    
    for (var i = 0, row; row = table.rows[i]; i++) {
       //iterate through rows
       //rows would be accessed using the "row" variable assigned in the for loop
       
       var url = '';
       var latitude = '';
       var longitude = '';
       
       for (var j = 0, col; col = row.cells[j]; j++) {
         //iterate through columns
         //columns would be accessed using the "col" variable assigned in the for loop
         
         if (j == 2) {
             url = col.innerHTML;
         }
         else if (j == 3) {
             latitude = parseFloat(col.innerHTML);
         }
         else if (j == 4) {
             longitude = parseFloat(col.innerHTML);
         }
       }
       
       // alert('add marker at (' + latitude + ', ' + longitude + ') with icon ' + url + ' to map ' + window.map_export);
       
        var pos = new google.maps.LatLng(latitude, longitude);
        var marker = new google.maps.Marker({
            position: pos,
            map: window.map_export,
            icon: 'https://s3.amazonaws.com/selt/photo.png',
            url: url
        });
        
        google.maps.event.addListener(marker, 'click', function() {
          window.location.href = marker.url;
        });
        
        // marker.setMap(window.map_export);
    }
};