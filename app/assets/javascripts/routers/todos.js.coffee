class Anode.Routers.Todos extends Backbone.Router
  routes:
    '!/todos': 'index'
    '!/todos/:id': 'show'
  initialize: ->
    @collection = new Anode.Collections.Todos()
    @collection.fetch()
  index: ->
    view = new Anode.Views.TodosIndex(collection: @collection)
    $('#container').html(view.render().el)
  show: (id) ->
    console.log "id: #{id}"
