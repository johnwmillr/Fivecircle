jQuery ->
    markersArray = []
    map = null
    marker = null

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
            
            #Creating The map
            map = new google.maps.Map(document.getElementById("map"),mapOptions)
            
            marker = new google.maps.Marker
                map: map
                # position: new google.maps.LatLng(lat,lon)

    applyLocation = (location) ->
        latitude = location.coords.latitude
        longitude = location.coords.longitude
        marker.setPosition(new google.maps.LatLng(latitude, longitude))
        map.setCenter(new google.maps.LatLng(latitude, longitude))
        map.setZoom(19)


    $(document).ready ->
        setInterval () ->            
            navigator.geolocation.getCurrentPosition applyLocation
        , 1000