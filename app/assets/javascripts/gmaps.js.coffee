# =======================================================================================================  Initialize GOOGLE MAP
#initializeGMaps = ->
#  lat = 49.847205
#  lng = 24.025483
#  latlng = new google.maps.LatLng(lat, lng)
#
#  # Create an array of styles.
#  styles = [
#    {
#      elementType: "geometry"
#      stylers: [
##        { "visibility": "on" },
#        { "weight": 1.2 },
##        { "hue": "#ffd500" },
##        { "lightness": 2 },
##        { "gamma": 0.8 }
#        {
#          visibility: "simplified"
#        }
#      ]
#    }
#    {
#      featureType: "road"
#      elementType: "labels"
#      stylers: [visibility: "off"]
#    }
#  ]
#
#  # Create a new StyledMapType object, passing it the array of styles,
#  # as well as the name to be displayed on the map type control.
#  styledMap = new google.maps.StyledMapType(styles,
#    name: "Styled Map"
#  )
#
#  contentString = "<div id=\"content\">" + "<div id=\"siteNotice\">" + "</div>" + "<h1 id=\"firstHeading\" class=\"firstHeading\">Uluru</h1>" + "<div id=\"bodyContent\">" + "<p><b>Uluru</b>, also referred to as <b>Ayers Rock</b>, is a large " + "sandstone rock formation in the southern part of the " + "Northern Territory, central Australia. It lies 335&#160;km (208&#160;mi) " + "south west of the nearest large town, Alice Springs; 450&#160;km " + "(280&#160;mi) by road. Kata Tjuta and Uluru are the two major " + "features of the Uluru - Kata Tjuta National Park. Uluru is " + "sacred to the Pitjantjatjara and Yankunytjatjara, the " + "Aboriginal people of the area. It has many springs, waterholes, " + "rock caves and ancient paintings. Uluru is listed as a World " + "Heritage Site.</p>" + "<p>Attribution: Uluru, <a href=\"https://en.wikipedia.org/w/index.php?title=Uluru&oldid=297882194\">" + "https://en.wikipedia.org/w/index.php?title=Uluru</a> " + "(last visited June 22, 2009).</p>" + "</div>" + "</div>"
#  infowindow = new google.maps.InfoWindow(content: contentString)
#
#
#
#
#  # Create a map object, and include the MapTypeId to add
#  # to the map type control.
#  mapOptions =
#    zoom: 14
#    center: latlng
#    scrollwheel: false
#    mapTypeControlOptions:
#      mapTypeIds: [
#        google.maps.MapTypeId.ROADMAP
#        "map_style"
#      ]
#
#  map = new google.maps.Map(document.getElementById("g-map"), mapOptions)
#
#  #Associate the styled map with the MapTypeId and set it to display.
#  map.mapTypes.set "map_style", styledMap
#  map.setMapTypeId "map_style"
#  #    marker
#  marker = new google.maps.Marker(
#    position: latlng
#    map: map
#    title: "«MAGIA OBRUS»"
#    icon: '/assets/LT-map-marker.png'
##    icon: {
##      path: google.maps.SymbolPath.CIRCLE
##      scale: 10
##    }
#  google.maps.event.addListener marker, "click", ->
#    infowindow.open map, marker
#  )
#
#
## ======================================================================================================== end GOOGLE MAP
#google.maps.event.addDomListener window, "load", initializeGMaps



initialize = ->
  lat = 49.847205
  lng = 24.025483
  myLatlng = new google.maps.LatLng(lat, lng)
  mapOptions =
    zoom: 14
    center: myLatlng

  map = new google.maps.Map(document.getElementById("g-map"), mapOptions)
  contentString = "<div id=\"content\">" + "<div id=\"siteNotice\">" + "</div>" + "<h1 id=\"firstHeading\" class=\"firstHeading\">Magia Obrus</h1>" + "<div id=\"bodyContent\">" + "<p><b>Uluru</b>, also referred to as <b>Ayers Rock</b>, is a large " + "sandstone rock formation in the southern part of the " + "Northern Territory, central Australia. It lies 335&#160;km (208&#160;mi) " + "south west of the nearest large town, Alice Springs; 450&#160;km " + "(280&#160;mi) by road. Kata Tjuta and Uluru are the two major " + "features of the Uluru - Kata Tjuta National Park. Uluru is " + "sacred to the Pitjantjatjara and Yankunytjatjara, the " + "Aboriginal people of the area. It has many springs, waterholes, " + "rock caves and ancient paintings. Uluru is listed as a World " + "Heritage Site.</p>" +  "(last visited June 22, 2009).</p>" + "</div>" + "</div>"
  infowindow = new google.maps.InfoWindow(content: contentString)
  marker = new google.maps.Marker(
    position: myLatlng
    map: map
    ico: '/assets/LT-map-marker.png'
    title: "Magia Obrus "
  )
  google.maps.event.addListener marker, "click", ->
    infowindow.open map, marker

google.maps.event.addDomListener window, "load", initialize