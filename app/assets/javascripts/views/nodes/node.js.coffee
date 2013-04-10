class Anode.Views.Node extends Backbone.View
  template: JST['nodes/node']
  tagName: 'li'
  className: 'node'

  events:
    'click .node_content': 'showDetail'

  render: ->
    $(@el).html(@template(node: @model))
    this

  showDetail: ->
    console.log($(@el).html())
