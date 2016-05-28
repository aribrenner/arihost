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

  def destroy
    if params[:hitable_type] == Node.name
      current_user.node_hits.find(params[:id])
    elsif params[:hitable_type] == Pixel.name
      current_user.pixel_hits.find(params[:id])
    end.destroy

    render json: {success: true, id: params[:id]}
  end
end
