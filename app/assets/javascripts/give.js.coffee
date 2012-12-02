$ ->
	if $("#jsGivePage").length > 0
  	initGive()

initGive = () ->
	map = mapbox.map('jsMap')
	map.addLayer(mapbox.layer().id('benjaminbouwyn.map-r3r04347'))
	map.zoom(1)

	$("body").delegate "#location", "blur", (e) ->
		location = $(this).val()
		if location != ''
			$.getJSON "/geocoder?s="+location, (data) ->
				location = data.results[0].geometry.location
				$('#lat').val(location.lat)
				$('#long').val(location.lng)

				markerLayer = mapbox.markers.layer().features([
				  geometry:
				    type: "Point"
				    coordinates: [location.lng, location.lat]

				  properties:
				    image: "http://d7q85mn3faw4b.cloudfront.net/clients/popmarket/offre-decouverte/map-marker.png"
				]).factory((f) ->
				  img = document.createElement("img")
				  img.className = "marker-image"
				  img.setAttribute "src", f.properties.image
				  img
				)
				map.addLayer(markerLayer)
				
				map.centerzoom({lat: location.lat, lon: location.lng}, 5, true)
				
				