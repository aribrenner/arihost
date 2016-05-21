class RedirectsController < ApplicationController

  def find_redirect
    node = Node.find_by_short_url(params[:short_url])
    raise ActionController::RoutingError.new(:short_url) unless node
    redirect_to node.redirect_url
  end

end
