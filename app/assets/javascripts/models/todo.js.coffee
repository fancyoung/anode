class Anode.Models.Todo extends Backbone.Model

  toggle: ->
    @set(done: true)
    @save
    @trigger('highlight')
