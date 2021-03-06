$(document).ready(function(){
    // wait for the user's location to update on the map before adding the images
    setTimeout(function() {
        // alert('GOOOOOO');

        var table = document.getElementById("pins");
        var all_markers = [];

        for (var i = 0, row; row = table.rows[i]; i++) {
           //iterate through rows
           //rows would be accessed using the "row" variable assigned in the for loop

           var url = '';
           var latitude = '';
           var longitude = '';

           for (var j = 0, col; col = row.cells[j]; j++) {
             //iterate through columns
             //columns would be accessed using the "col" variable assigned in the for loop

             if (j == 3) {
                 latitude = parseFloat(col.innerHTML);
             }
             else if (j == 4) {
                 longitude = parseFloat(col.innerHTML);
             }
             else if (j == 5) {
                 url = col.innerHTML;
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
              window.location.href = this.url;
            });

            // marker.setMap(window.map_export);

        }

    }, 3000);
});
