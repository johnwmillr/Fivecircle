jQuery ->
    markersArray = []
    lat_field = $('#place_latitude')
    lng_field = $('#place_longitude')
    window.initMap = ->
        if $('#map').size() > 0
            map = new google.maps.Map document.getElementById('map'), {
                center: {lat: 41.66085, lng: -91.53054}
                zoom: 13
            }
        map.addListener 'click', (e) ->
            placeMarkerAndPanTo e.latLng, map
            updateFields e.latLng

    placeMarkerAndPanTo = (latLng, map) ->
        markersArray.pop().setMap(null) while(markersArray.length)
        marker = new google.maps.Marker
            position: latLng
            map: map

        map.panTo latLng
        markersArray.push marker

    updateFields = (latLng) ->
        lat_field.val latLng.lat()
        lng_field.val latLng.lng()