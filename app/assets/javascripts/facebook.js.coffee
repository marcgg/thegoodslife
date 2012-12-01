$('.jsFacebookLogin').click ->
  FB.login (response) ->
    if response.status == 'connected'
      console.log(response.authResponse)
      FB.api '/me', (response) ->
        console.log response
