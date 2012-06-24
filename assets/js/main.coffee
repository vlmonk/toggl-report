$ ->
  apiKey = new window.Toggl.Setting { id: 'apikey' }
  apiKey.fetch();

  view = new window.Toggl.Views.Apikey model: apiKey
  $('#master').html view.el
