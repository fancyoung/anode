class Anode.Models.Todo extends Backbone.Model
  idAttribute: '_id'
  defaults:
    content: ''
    done: false
  toggle: ->
    @save({done: !@get('done')})
