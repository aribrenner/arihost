class Api::HitsController < ApplicationController

  before_filter :allow_cors

  def index
    hitable = if short_url = params[:node_short_url]
      Node.find_by_short_url(short_url)
    elsif short_url = params[:pixel_short_url]
      Pixel.find_by_short_url(short_url)
    end
    @referer = request.referer
    @hits = hitable.hits
  end

  private

  def allow_cors
    headers['Access-Control-Allow-Origin'] = '*'
  end

end
