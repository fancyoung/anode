class Anode.Routers.Nodes extends Backbone.Router
  routes:
    '!/nodes': 'index'
    '!/nodes/:id': 'show'
  initialize: ->
    @collection = new Anode.Collections.Nodes()
    @collection.fetch()
  index: ->
    view = new Anode.Views.NodesIndex(collection: @collection)
    $('#container').html(view.render().el)
  show: (id) ->
    console.log "id: #{id}"
