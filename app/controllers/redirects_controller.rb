class RedirectsController < ApplicationController

  def get_node
    @type = Node
    if find_hitable
      create_hit
      redirect_to @hitable.redirect_url
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

  def find_hitable
    @hitable = @type.find_by_short_url(params[:short_url])
  end

  def create_hit
    Hit.create(
      ip: request.remote_ip,
      device: request.user_agent,
      hitable: @hitable,
      hitable_type: @type.name
    )
  end

end
