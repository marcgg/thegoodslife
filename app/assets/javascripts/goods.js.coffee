$ ->
	initGoodPage()

initGoodPage = () ->
	$("body").delegate ".jsPhotoList", "click", (e) ->
		e.preventDefault
		$this = $(this)
		imgUrl = $this.attr('data-img')
		$('#jsBigPhoto').css({'background-image': 'url('+imgUrl+')'})

	$(window).scroll ->
		pos = $(document).scrollTop()
		if pos > 110
			$('#jsGoodPage').addClass('blocked')
		else
			$('#jsGoodPage').removeClass('blocked')
	
	$("body").delegate ".jsMilestone", "mouseover", (e) ->
		e.preventDefault
		$this = $(this)
		imgUrl = $this.attr('data-img')
		console.log imgUrl
		if imgUrl != ''
			$('#jsBigPhoto').css({'background-image': 'url('+imgUrl+')'})
		
