jQuery ->
    markersArray = []
    marker = null
    lat_field = 0#$('#place_latitude')
    lng_field = 0#$('#place_longitude')
    lat =$('#lat')
    #.geolocation.getCurrentPosition applyLocation
    window.initMap = ->
        
        if $('#map').size() > 0
            #Defining settings for map
            mapOptions =
                center: new google.maps.LatLng(41.66085, -91.53054)
                zoom: 17
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
            #navigator.geolocation.getCurrentPosition applyLocation
        
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
        marker.setPosition(new google.maps.LatLng(location.coords.latitude, location.coords.longitude))
        #center: new google.maps.LatLng(location.coords.latitude,location.coords.longitude)
        lat_field = location.coords.latitude
        lng_field = location.coords.longitude

    $(document).ready ->
        #navigator.geolocation.getCurrentPosition applyLocation
        setInterval () ->
            navigator.geolocation.getCurrentPosition applyLocation
        , 1000
        
        $('#Check-in').click (e) ->
            e.preventDefault()
            $.ajax 'users/:user_id/checkin',
                type: 'POST'
                dataType: 'text'
                data: {coordinates: {lat: lat_field, lon: lng_field},
                error: (jqXHR, textStatus, errorThrown) ->
                    alert textStatus
                success: (data, textStatus, jqXHR) ->
                    console.log "checked in"


