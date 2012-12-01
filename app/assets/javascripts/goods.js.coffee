$ ->
	initGoodPage()

initGoodPage = () ->

	map = mapbox.map('jsMap')
	map.addLayer(mapbox.layer().id('benjaminbouwyn.map-r3r04347'))

	markerLayer = mapbox.markers.layer().features(myPoints).factory((f) ->
	  img = document.createElement("img")
	  img.className = "marker-image"
	  img.setAttribute "src", f.properties.image
	  img
	)
	map.addLayer(markerLayer).setExtent markerLayer.extent()
	map.zoom(10, true);

	$("body").delegate ".jsPhotoList", "click", (e) ->
		e.preventDefault
		$this = $(this)
		imgUrl = $this.attr('data-img')
		$('#jsBigPhoto').css({'background-image': 'url('+imgUrl+')'})

	$(window).scroll ->
		pos = $(document).scrollTop()
		page = $('#jsGoodPage')
		if pos > 110
			page.addClass('blocked')
		else
			if page.hasClass('blocked')
				page.removeClass('blocked')
				if $('#jsMap').hasClass('jsMoved')
					$('#jsMap').removeClass('jsMoved')
					map.addLayer(markerLayer).setExtent markerLayer.extent()
					map.zoom(10);
	
	$("body").delegate ".jsMilestone", "mouseover", (e) ->
		e.preventDefault
		$this = $(this)
		imgUrl = $this.attr('data-img')
		lat = $this.attr('data-lat')
		lon = $this.attr('data-long')
		if imgUrl != ''
			$('#jsBigPhoto').css({'background-image': 'url('+imgUrl+')'})
		if lat != '' && lon != ''
			$('#jsMap').addClass('jsMoved')
			map.ease.location({
				lat: lat,
				lon: lon
			}).zoom(12).optimal();