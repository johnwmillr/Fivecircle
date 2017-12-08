jQuery ->
    markersArray = []
    map = null
    marker = null
    zoom_and_pan_were_set = false
    window.initMap = ->
        if $('#map').size() > 0
            #Defining settings for map
            mapOptions =
                center: new google.maps.LatLng(41.6608501,-91.5305475)
                zoom: 15
                streetViewControl: false
                panControl: false
                mapTypeId: google.maps.MapTypeId.ROADMAP
                zoomControlOptions:
                    style: google.maps.ZoomControlStyle.SMALL
                mapTypeControlOptions:
                    mapTypeIds: [google.maps.MapTypeId.ROADMAP, 'map_style']

            #Creating the map and marker
            map = new google.maps.Map(document.getElementById("map"),mapOptions)
            marker = new google.maps.Marker
                map: map

    updateMap = (location) ->
        coords = location.coords
        # Readjusts the map center and zoom level the first time it runs
        if zoom_and_pan_were_set != true
            map.setCenter(new google.maps.LatLng(coords.latitude, coords.longitude))
            map.setZoom(19)
            zoom_and_pan_were_set = true

        # Moves the marker to user's current location
        marker.setPosition(new google.maps.LatLng(coords.latitude, coords.longitude))

    geo_error = () ->
        # alert "Geolocation error!"

    geo_options =
        enableHighAccuracy: true
        timeout: Infinity
        maximumAge: 0

    $(document).ready ->
        # if zoom_and_pan_were_set != true
            # navigator.geolocation.getCurrentPosition(testAjax,on_error)

        setInterval () ->
            navigator.geolocation.getCurrentPosition(updateMap, geo_error, geo_options)
        , 1000