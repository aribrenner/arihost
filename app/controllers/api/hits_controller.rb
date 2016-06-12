class Api::HitsController < ApplicationController

  def index
    hitable = if short_url = params[:node_short_url]
      Node.find_by_short_url(short_url)
    elsif short_url = params[:pixel_short_url]
      Pixel.find_by_short_url(short_url)
    end

    @hits = hitable.hits
  end

end
