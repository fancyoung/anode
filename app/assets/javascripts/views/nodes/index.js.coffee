class Anode.Views.NodesIndex extends Backbone.View

  template: JST['nodes/index']

  initialize: ->
    @collection.on('reset', @render, this)
    @collection.on('add', @prependNode, this)

  render: ->
    $(@el).html(@template())
    this.renderForm()
    @collection.each(@prependNode, this)
    this

  renderForm: ->
    view = new Anode.Views.NodesForm()
    $('#node_form').html(view.render(@collection).el)

  prependNode: (node) ->
    view = new Anode.Views.Node(model: node)
    $('#node_list').prepend(view.render().el)
