class Anode.Views.Node extends Backbone.View
  template: JST['nodes/node']
  tagName: 'li'

  render: ->
    $(@el).html(@template(node: @model))
    this
