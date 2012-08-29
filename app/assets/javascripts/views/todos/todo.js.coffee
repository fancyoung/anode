class Anode.Views.Todo extends Backbone.View
  template: JST['todos/todo']
  tagName: 'li'

  events:
    'click input[type=checkbox]': 'toggleDone'
    'click .destroy': 'destroy'
    'mouseenter': 'showBtn'
    'mouseleave': 'hideBtn'
    'dblclick .view': 'edit'
    'blur .edit': 'doEdit'
    'keypress .edit': 'updateOnEnter'

  initialize: ->
    @model.on('change', @render, this)
    @model.on('destroy', @remove, this)
  
  render: ->
    $(@el).html(@template(todo: @model))
    @input = @$('.edit')
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

  edit: ->
    $(@el).addClass('editing')
    @input.focus()

  doEdit: ->
    value = @input.val()
    if value==''
      @model.destroy()
    else
      @model.save({content: value})
      $(@el).removeClass('editing')
    
  updateOnEnter: (event) ->
    if event.keyCode == 13
      @doEdit()
