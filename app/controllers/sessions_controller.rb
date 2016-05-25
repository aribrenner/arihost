class SessionsController < ApplicationController

  before_action :ensure_signed_out, only: [:new, :create]

  def create
    user = User.find_from_credentials(
      username: params[:user][:username],
      password: params[:user][:password]
    )

    if user
      sign_in(user)
      redirect_user
    else
      flash[:error] = 'username or password incorrect'
      render :new
    end
  end

  def destroy
    sign_out
    flash[:notice] = 'bye!'
    redirect_to new_session_path
  end

  private

  def redirect_user
    redirect_path = session[:redirect_path]
    if redirect_path
      redirect_to session.delete(:redirect_path)
    else
      flash[:notice] = 'welcome back!'
      redirect_to nodes_path
    end
  end

end
