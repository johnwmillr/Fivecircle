jQuery ->
    markersArray = []
    map = null
    marker = null
    zoom_and_pan_were_set = false
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

    # setup = () ->
            
        # $('<div id="Available coupons"></div>').
        #     hide().
        #     appendTo($('body'))

            
    
    # getCoupon = () ->
    #     $.ajax 
    #         type: 'GET'
    #         url: $(this).attr('href')
    #         timeout: 5000
    #         success: #TODO,
    #         error:  alert('Error!')

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
            # data: {coordinates: {latitude: lat, longitude: lon}}
            data: {test: "hi"}
            success: (data, textStatus, jqXHR) ->
                $('body').append "Successful AJAX call."      
              
    printAName = () ->
        console.log("JOHN!!!")
              
    on_error = () ->
        alert "ERROR!!"
              
    $(document).ready ->

        if zoom_and_pan_were_set != true
            navigator.geolocation.getCurrentPosition(testAjax,on_error)

        id = navigator.geolocation.watchPosition(updateMap,on_error)
        
        $(document).on "click", "#checkin", -> 
            # navigator.geolocation.clearWatch(id)
            navigator.geolocation.getCurrentPosition(testAjax())