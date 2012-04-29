module NodeHelper
  def render_nodes(nodes)
    render partial: 'nodes/nodes', locals: {
      nodes: nodes
    }
  end
end
