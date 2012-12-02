$ ->
  initGive()

initGive = () ->
	$("body").delegate "#location", "blur", (e) ->
		location = $(this).val()
		console.log location