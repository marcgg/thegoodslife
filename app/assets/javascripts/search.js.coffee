$ ->
	initSearchPage()

initSearchPage = () ->
	$("body").delegate ".jsGoodLink", "click", (e) ->
		e.preventDefault
		$this = $(this)
		link = $this.find('a').attr('href')
		window.location = link
		
	$("body").delegate "#jsFocusSearch", "click", (e) ->
		e.preventDefault
		$('#search').focus()
		$('#jsSplashHome').animate {'opacity':0, 'height': 0}
