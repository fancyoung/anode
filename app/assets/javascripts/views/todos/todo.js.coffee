class Anode.Views.Todo extends Backbone.View
  template: JST['todos/todo']
  tagName: 'li'

  events:
    'click input[type=checkbox]': 'toggleDone'

  initialize: ->
    @model.on('change', @render, this)  
  
  render: ->
    $(@el).html(@template(todo: @model))
    this

  toggleDone: (event) ->
    @model.toggle()
