class Anode.Views.NodesForm extends Backbone.View

  template: JST['nodes/form']

  events:
    'submit #new_node': 'createNode'

  render: (collection) ->
    @collection = collection
    $(@el).html(@template())
    this

  createNode: (event) ->
    event.preventDefault()
    attributes = content: $('#new_node_content').val()
    @collection.create attributes,
      wait: true
      success: ->
        $('#new_node')[0].reset()
      error: @handleError

  handleError: () ->
    alert('error')
