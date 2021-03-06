class NodesController < ApplicationController

  before_action :ensure_signed_in, only: :index

  def new
    @node = Node.new(redirect_url: build_redirect_from_url)
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
    @node = Node.find_by_short_url(params[:short_url])
    raise ActionController::RoutingError.new(:short_url) unless @node
    @hits = @node.hits
  end

  def index
    @nodes = current_user.nodes.includes(:hits)
  end

  private

  def create_params
    attrs = [:redirect_url]
    attrs.push(:short_url) if current_user.try(:admin?)
    params.require(:node).permit(*attrs)
  end

  def build_redirect_from_url
    redirect_url = params[:node_redirect_url]
    return unless redirect_url
    redirect_url += "?#{request.query_string}" if request.query_string.present?
    redirect_url
  end

end
