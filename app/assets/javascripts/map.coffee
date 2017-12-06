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

    # setup = () ->
            
    #     $('<div id="Available coupons"></div>').
    #         hide().
    #         appendTo($('body'))
    #     $('#checkin').click(getMovieInfo)
    
    # getCoupon = () ->
    #     $.ajax 
    #         type: 'GET'
    #         url: $(this).attr('href')
    #         timeout: 5000
    #         success: #TODO,
    #         error:  alert('Error!')

    testAjax = (location) ->
        console.log('Testing AJAX...')
        lat = location.coords.latitude
        log = location.coords.longitude
        console.log('lat: ')
        console.log(lat)
        $.ajax 'checkin',
            type: "POST"
            dataType: "text"
            coordinates: {lat: x, lon: y}
            data: {coordinates:{lat: "#{lat}", lon: "#{log}"}            
            success: (data, textStatus, jqXHR) ->
                $('body').append "Successful AJAX call."            
        
    $(document).ready ->
        if zoom_and_pan_were_set != true
            navigator.geolocation.getCurrentPosition(testAjax)

        id = navigator.geolocation.watchPosition(updateMap)

