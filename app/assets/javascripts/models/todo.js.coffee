class Anode.Models.Todo extends Backbone.Model
  idAttribute: '_id'

  toggle: ->
    @save({done: !@get('done')})
