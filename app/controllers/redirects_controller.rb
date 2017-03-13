class RedirectsController < ApplicationController

  before_filter :allow_cors, only: :get_pixel

  def get_node
    @type = Node
    if find_hittable
      create_hit
      redirect_to @hittable.redirect_url_with_scheme
    else
      raise ActionController::RoutingError.new(:short_url)
    end
  end

  def get_pixel
    @type = Pixel
    create_hit if find_hittable
    send_file('public/transparent.png',
          filename: 'image.png',
          type: 'img/png',
          disposition: 'inline'
    )
  end

  private

  attr_reader :last_hit

  delegate :remote_ip, :user_agent, to: :request

  def find_hittable
    @hittable = @type.find_by_short_url(params[:short_url])
  end

  def create_hit
    return if ignore_hit?
    Hit.create(
      ip: remote_ip,
      device: user_agent,
      hittable: @hittable,
      hittable_type: @type.name,
      location: {},
      meta: params[:meta]
    )
  end

  def ignore_hit?
    @last_hit = @hittable.hits.last
    return false unless last_hit && last_hit.ip.present?
    own_hittable? || (under_threshold? && same_data?)
  end

  def under_threshold?
    Time.now - last_hit.created_at < Hit::IGNORE_THRESHOLD
  end

  def same_data?
    last_hit.ip == remote_ip && last_hit.meta == params[:meta]
  end

  def own_hittable?
    @hittable.user == current_user
  end

end
