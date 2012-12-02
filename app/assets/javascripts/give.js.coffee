$ ->
  initGive()

initGive = () ->
	$("body").delegate "#location", "blur", (e) ->
		location = $(this).val()
		if location != ''
			$.getJSON "/geocoder?s="+location, (data) ->
			  console.log data