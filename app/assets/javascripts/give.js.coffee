$ ->
  initGive()

initGive = () ->
	$("body").delegate "#location", "blur", (e) ->
		