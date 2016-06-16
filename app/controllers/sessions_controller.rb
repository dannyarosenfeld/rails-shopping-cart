class SessionsController < ApplicationController

  include SessionsHelper

  def new
  end

  def create
    @user = User.find_by(username: params[:session][:username].downcase)

    if @user && @user.authenticate(params[:session][:password])
      log_in(@user)
      flash[:success] = 'You are logged in!'
      redirect_to items_path
    else
      flash[:danger] = 'Invalid username/password, please try again'
      redirect_to login_path
    end
  end

  def destroy
    log_out
    flash[:success] = 'You are logged out!'
    redirect_to items_path
  end
end
