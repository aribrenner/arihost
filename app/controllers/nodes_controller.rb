class NodesController < ApplicationController

  before_action :ensure_signed_in, except: :find_redirect
  before_action :find_by_short_url, only: [:find_redirect, :show]

  def find_redirect
    redirect_to @node.redirect_url
  end

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
  end

  def index
    @nodes = current_user.nodes
  end

  private

  def create_params
    params.require(:node).permit(:redirect_url)
  end

  def find_by_short_url
    @node = Node.find_by_short_url(params[:short_url])
    raise ActionController::RoutingError.new(:short_url) unless @node
  end

end
