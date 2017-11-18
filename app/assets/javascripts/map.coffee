jQuery ->
    markersArray = []
    marker = null
    lat_field = $('#place_latitude')
    lng_field = $('#place_longitude')
    window.initMap = ->
        if $('#map').size() > 0
            #Defining settings for map
            mapOptions =
                center: new google.maps.LatLng(41.66085, -91.53054)
                zoom: 19
                streetViewControl: false
                panControl: false
                mapTypeId: google.maps.MapTypeId.ROADMAP
                zoomControlOptions: 
                    style: google.maps.ZoomControlStyle.SMALL
                mapTypeControlOptions:
                    mapTypeIds: [google.maps.MapTypeId.ROADMAP, 'map_style']
            
            #Creating The map
            map = new google.maps.Map(document.getElementById("map"),mapOptions)
            
            marker = new google.maps.Marker
                map: map
                position: new google.maps.LatLng(41.66085, -91.53054)
        
        # map.addListener 'click', (e) ->
        #     placeMarkerAndPanTo e.latLng, map
        #     updateFields e.latLng

    # placeMarkerAndPanTo = (latLng, map) ->
    #     alert(latlng)
    #     markersArray.pop().setMap(null) while(markersArray.length)
    #     marker = new google.maps.Marker
    #         position: latLng
    #         map: map
    #     map.panTo latLng
    #     markersArray.push marker

    # updateFields = (latLng) ->
    #     lat_field.val latLng.lat()
    #     lng_field.val latLng.lng()
        
    applyLocation = (location) ->
        #alert('Latitude:' + location.coords.latitude + ', Longitude: ' + location.coords.longitude + ', Accuracy: ' + location.coords.accuracy)
        marker.setPosition(new google.maps.LatLng(location.coords.latitude, location.coords.longitude))

    $(document).ready ->
        setInterval () ->
            navigator.geolocation.getCurrentPosition applyLocation
            #alert('woo')
        , 1000

