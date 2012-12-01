$ ->
	initSearchPage()

initSearchPage = () ->
	$("body").delegate ".jsGoodLink", "click", (e) ->
		e.preventDefault
		$this = $(this)
		link = $this.find('a').attr('href')
		window.location = link
    