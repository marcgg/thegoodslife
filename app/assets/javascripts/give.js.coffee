$ ->
  initGive()

initGive = () ->
	$("body").delegate "#location", "blur", (e) ->
		location = $(this).value()