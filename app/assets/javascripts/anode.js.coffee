window.Anode =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  init: ->
    new Anode.Routers.Nodes()
    new Anode.Routers.Todos()
    Backbone.history.start()

$(document).ready ->
  Anode.init()
