login = (url) ->
  FB.api '/me', (user) ->
    $.ajax url,
      type: 'POST'
      data:
        user:
          facebook_id: user.id
          name: user.name
    .done ->
      window.location.reload()

fb_login = (url) ->
  FB.login (response) =>
    if response.status == 'connected'
      login(url)
  , scope: 'publish_actions'

$('.jsFacebookLogin').click (event) ->
  event.preventDefault()
  url = $(this).attr('href')
  FB.getLoginStatus (response) =>
    if response.status == 'connected'
      FB.api '/me/permissions', (permissions) ->
        if permissions.data[0].publish_actions
          login(url)
        else
          fb_login(url)
    else
      fb_login(url)
