class UsersController < ApplicationController

  before_action :ensure_signed_out, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.create(create_params)
    if @user.save
      sign_in(@user)
      flash[:notice] = 'account created!'
      redirect_to nodes_path
    else
      flash_errors(@user)
      render :new
    end
  end

  private

  def create_params
    params.require(:user).permit(:username, :password)
  end
end
