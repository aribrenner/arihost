class HitsController < ApplicationController

  def destroy
    if params[:hittable_type] == Node.name
      current_user.node_hits.find(params[:id])
    elsif params[:hittable_type] == Pixel.name
      current_user.pixel_hits.find(params[:id])
    end.destroy

    render json: {success: true, id: params[:id]}
  end

end
