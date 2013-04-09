class Anode.Views.NodesIndex extends Backbone.View

  template: JST['nodes/index']

  initialize: ->
    @collection.on('reset', @render, this)
    @collection.on('add', @prependNode, this)

  events:
      'submit #new_node': 'createNode'

  render: ->
    $(@el).html(@template())
    this.renderForm()
    $('#new_node_content').focus()
    @collection.each(@prependNode, this)
    this

  prependNode: (node) ->
    view = new Anode.Views.Node(model: node)
    $('#node_list').prepend(view.render().el)

  renderForm: ->
    html = JST['nodes/form']()
    $('#node_form').html(html)

  createNode: (event) ->
    event.preventDefault()
    attributes = content: $('#new_node_content').val()
    @collection.create attributes,
      wait: true
      success: ->
        $('#new_node')[0].reset()
      error: @handleError

  handleError: (model, error) ->
    console.log args    
