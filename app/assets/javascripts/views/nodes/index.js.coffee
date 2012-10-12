class Anode.Views.NodesIndex extends Backbone.View

  template: JST['nodes/index']

  initialize: ->
    @collection.on('reset', @render, this)

  render: ->
    $(@el).html(@template())
    @collection.each(@prependNode, this)
    this

  prependNode: (node) ->
    view = new Anode.Views.Node(model: node)
    $('#node_list').prepend(view.render().el)
