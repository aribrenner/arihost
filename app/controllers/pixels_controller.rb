class PixelsController < ApplicationController

  before_action :ensure_signed_in

  def new
    @pixel = Pixel.new
  end

  def create
    @pixel = Pixel.new(create_params.merge(
      user: current_user
    ))

    if @pixel.save
      flash[:notice] = 'Tracking pixel created!'
      redirect_to pixel_path(@pixel.short_url)
    else
      flash_errors(@pixel)
      render :new
    end
  end

  def show
    @pixel = Pixel.find_by_short_url(params[:short_url])
    @hits = @pixel.hits
  end

  def index
    @pixels = current_user.pixels.includes(:hits)
  end

  private

  def create_params
    params.require(:pixel).permit(:name, :description)
  end


end
