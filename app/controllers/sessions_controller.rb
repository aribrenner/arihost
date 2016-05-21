class SessionsController < ApplicationController

  def create
    user = User.find_from_credentials(
      username: params[:user][:username],
      password: params[:user][:password]
    )

    if user
      sign_in(user)
      flash[:notice] = 'welcome back!'
      redirect_to nodes_path
    else
      flash[:error] = 'username or password incorrect'
      render :new
    end
  end

end
