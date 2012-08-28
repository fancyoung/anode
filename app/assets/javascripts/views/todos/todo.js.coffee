class Anode.Views.Todo extends Backbone.View
  template: JST['todos/todo']
  tagName: 'li'

  events:
    'click input[type=checkbox]': 'toggleDone'
    'click .destroy': 'destroy'
    'mouseenter': 'showBtn'
    'mouseleave': 'hideBtn'

  initialize: ->
    @model.on('change', @render, this)  
  
  render: ->
    $(@el).html(@template(todo: @model))
    this

  toggleDone: (event) ->
    @model.toggle()

  showBtn: ->
    $(@el).find('.destroy').show()

  hideBtn: ->
    $(@el).find('.destroy').hide()

  destroy: (event) ->
    event.preventDefault()
    @model.destroy
      success: ->
        console.log('ss')
