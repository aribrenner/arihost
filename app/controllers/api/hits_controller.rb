class Api::HitsController < ApplicationController

  before_filter :allow_cors

  def index
    hittable = if short_url = params[:node_short_url]
      Node.find_by_short_url(short_url)
    elsif short_url = params[:pixel_short_url]
      Pixel.find_by_short_url(short_url)
    end

    @hits = hittable.hits

    get_hits_data
  end

  private

  def get_hits_data
    @serialized_hits = @hits.order(:created_at).map { |h| HitSerializer.new(h).as_json }
    @count = @hits.size
    @timeline = @serialized_hits.map { |h| h[:timestamp] }
    @uniq_hits = @hits.group(:meta).count.count
    @referer = request.referer
  end

end
