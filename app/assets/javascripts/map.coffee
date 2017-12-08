jQuery ->
    markersArray = []
    map = null
    marker = null
    zoom_and_pan_were_set = false

    if !navigator.geolocation
        alert "Geolocation is not supported by your browser :("
    coords =
        latitude: 41.6608501
        longitude: -91.5305475
        
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
          
    geo_options =
        enableHighAccuracy: true # Default = false
        maximumAge: 0 # Default = 0
        timeout: Infinity # Default = Infinity
        
    testAjax = (location) ->
        console.log("ajax here AHMED!!!!!!")
        console.log(coords)
        lat = coords.latitude
        lon = coords.longitude
        console.log(lat)
        $.ajax ':user_id/checkin',
            # url: $(this).attr('href')
            type: "POST"
            dataType: "text"
            data: {coordinates: {latitude: lat, longitude: lon}}
            success: (data, textStatus, jqXHR) ->
                $('body').append "Successful AJAX call."                     
      
    $(document).ready ->
        
        $(document).on "click", "#checkin", -> 
            # navigator.geolocation.clearWatch(id)
            # navigator.geolocation.getCurrentPosition(testAjax())
            # getLocation
            testAjax();
            return false;
          
        setInterval () ->            
            navigator.geolocation.getCurrentPosition(updateMap)
        , 1000

        # We should have something like this that stops the tracking when user logs out:
        # navigator.geolocation.clearWatch(watchID);                       