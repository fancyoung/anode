class Anode.Views.TodosIndex extends Backbone.View

  template: JST['todos/index']

  events:
    'submit #new_todo': 'createTodo'

  initialize: ->
    @collection.on('reset', @render, this)
    @collection.on('add', @prependTodo, this)

  render: ->
    $(@el).html(@template())
    @collection.each(@prependTodo, this)
    this

  prependTodo: (todo) ->
    view = new Anode.Views.Todo(model: todo)
    $('#todos').prepend(view.render().el)

  createTodo: (event) ->
    event.preventDefault()
    attributes = content: $('#new_todo_content').val()
    @collection.create attributes,
      wait: true
      success: -> 
        $('#new_todo')[0].reset()
      error: @handleError

  handleError: (todo, response) ->
    if response.status == 422
      errors = $.parseJSON(response.responseText).errors
      for attribute, messages of errors
        alert "#{attribute} #{message}" for message in messages
