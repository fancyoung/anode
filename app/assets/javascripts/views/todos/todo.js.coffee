class Anode.Views.Todo extends Backbone.View
  template: JST['todos/todo']
  tagName: 'li'
  
  render: ->
    $(@el).html(@template(todo: @model))
    $(@el).attr('id', "todo_#{@model.get('_id')}")
    this
