class HitsController < ApplicationController

  before_action :ensure_signed_in

  def node_index
    @node = current_user.nodes.find_by_short_url(params[:node_short_url])
    @hits = @node.hits
  end

  def pixel_index
    @pixel = current_user.pixels.find_by_short_url(params[:pixel_short_url])
    @hits = @pixel.hits
  end
end
