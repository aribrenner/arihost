class NodesController < ApplicationController

  before_action :ensure_signed_in

  def new
    @node = Node.new
  end

  def create
    @node = Node.new(create_params)
    @node.user = current_user

    if @node.save
      flash[:notice] = 'url created!'
      redirect_to node_path(@node.short_url)
    else
      flash_errors(@node)
      render :new
    end
  end

  def show
    @node = current_user.nodes.find_by_short_url(params[:short_url])
    raise ActionController::RoutingError.new(:short_url) unless @node
  end

  def index
    @nodes = current_user.nodes.includes(:hits)
  end

  private

  def create_params
    if params[:node_redirect_url]
      build_redirect_from_url
    else
      params.require(:node).permit(:redirect_url)
    end
  end

  def build_redirect_from_url
    {
      redirect_url: params[:node_redirect_url] + '?' + request.query_string
    }
  end

end
