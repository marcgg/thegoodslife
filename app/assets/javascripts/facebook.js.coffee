$('.jsFacebookLogin').click (event) ->
  event.preventDefault()
  url = $(this).attr('href')
  FB.login (response) ->
    if response.status == 'connected'
      FB.api '/me', (user) ->
        $.ajax url,
          type: 'POST'
          data:
            user:
              facebook_id: user.id
              name: user.name
        .done ->
          window.location.reload()
