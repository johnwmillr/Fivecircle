window.map_export = null

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
            window.map_export = map
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

    fileUploadAJax = (location) ->
        lat = coords.latitude
        lon = coords.longitude
        $.ajax 'save_location',
            type: "POST"
            dataType: "text"
            data: {coordinates: {latitude: lat, longitude: lon}}
            success: (data, textStatus, jqXHR) ->

    geo_error = () ->
        # alert "Geolocation error!"

    geo_options =
        enableHighAccuracy: true # Default = false
        maximumAge: 0 # Default = 0
        timeout: Infinity # Default = Infinity
        
    testAjax = (location) ->
        lat = coords.latitude
        lon = coords.longitude
        $.ajax ':user_id/checkin',            
            type: "POST"
            dataType: "text"
            data: {coordinates: {latitude: lat, longitude: lon}}
            success: (results) ->
                console.log (results)  
                window.location = results
                                   
      
    $(document).ready ->        
        $(document).on "click", "#checkin", -> 
            testAjax();
            return false;
          
        $(document).on "click", "#medium_image", ->
            fileUploadAJax()
        
        setInterval () ->
            navigator.geolocation.getCurrentPosition(updateMap, geo_error, geo_options)
        , 1000
