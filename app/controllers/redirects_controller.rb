class RedirectsController < ApplicationController

  def get_node
    @type = Node
    if find_hitable
      create_hit
      redirect_to @hitable.redirect_url_with_scheme
    else
      raise ActionController::RoutingError.new(:short_url)
    end
  end

  def get_pixel
    @type = Pixel
    find_hitable
    create_hit if find_hitable
    send_file('public/transparent.png',
          filename: 'image.png',
          type: 'img/png',
          disposition: 'inline'
    )
  end

  private

  attr_reader :last_hit

  delegate :remote_ip, :user_agent, to: :request

  def find_hitable
    @hitable = @type.find_by_short_url(params[:short_url])
  end

  def create_hit
    return if ignore_hit?
    Hit.create(
      ip: remote_ip,
      device: user_agent,
      hitable: @hitable,
      hitable_type: @type.name
    )
  end

  def ignore_hit?
    @last_hit = @hitable.hits.last
    return false unless last_hit && last_hit.ip.present?
    under_threshold? && same_ip?
  end

  def under_threshold?
    Time.now - last_hit.created_at < Hit::IGNORE_THRESHOLD
  end

  def same_ip?
    last_hit.ip == remote_ip
  end

end
