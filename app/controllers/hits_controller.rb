class HitsController < ApplicationController

  before_action :ensure_signed_in

  def index
    if params[:node_short_url]
      find_node
      @hits = @node.hits
    else
      @hits = current_user.hits
    end
  end

  private

  def find_node
    @node = current_user.nodes.find_by_short_url(params[:node_short_url])
  end
end
