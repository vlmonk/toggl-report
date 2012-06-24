Apikey = Backbone.View.extend
  template: "<form><input type='text' name='value' /><input type='submit' /></form>"

  events:
    'submit form' : 'save'

  initialize: ->
    @model.on 'change', @render, @
    @render()

  render: ->
    @$el.html @template
    @$('input[name=value]').val @model.get('value')

  save: (e) ->
    e.preventDefault()
    value = @$('input[name=value]').val()
    @model.set 'value', value
    @model.save()

window.Toggl ||= {}
window.Toggl.Views ||= {}
window.Toggl.Views.Apikey = Apikey
