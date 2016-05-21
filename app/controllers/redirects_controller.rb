class RedirectsController < ApplicationController

  def find_redirect
    @node = Node.find_by_short_url(params[:short_url])
    raise ActionController::RoutingError.new(:short_url) unless @node
    create_hit
    redirect_to @node.redirect_url
  end

  def create_hit
    Hit.create(
      ip: request.remote_ip,
      device: request.user_agent,
      hitable: @node,
      hitable_type: Node.name
    )
  end

end
