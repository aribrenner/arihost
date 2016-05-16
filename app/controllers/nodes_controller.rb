class NodesController < ApplicationController

  def find_redirect
    node = Node.find_by_short_url(params[:short_url])
    if node
      redirect_to node.redirect_url
    else
      raise ActionController::RoutingError.new(:short_url)
    end
  end

end
