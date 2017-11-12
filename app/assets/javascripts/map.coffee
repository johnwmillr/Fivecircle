jQuery ->
    markersArray = []
    lat_field = $('#place_latitude')
    lng_field = $('#place_longitude')
    window.initMap = ->
        if $('#map').size() > 0
            map = new google.maps.Map document.getElementById('map'), {
                center: {lat: 41.66085, lng: -91.53054}
                zoom: 16
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
        
    applyLocation = (location) ->
        # alert('Latitude:' + location.coords.latitude + ', Longitude: ' + location.coords.longitude + ', Accuracy: ' + location.coords.accuracy)
        #marker = new google.maps.Marker
        #   position: {lat: location.coords.latitude, lng: location.coords.longitude}
        #    map: map
        placeMarkerAndPanTo {lat: location.coords.latitude, lng: location.coords.longitude}, map
    $(document).ready ->
        setInterval () ->
            navigator.geolocation.getCurrentPosition applyLocation
            #alert('woo')
        , 2000