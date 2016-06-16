class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = "Thank you for registering!"
      redirect_to items_path
    else
      flash[:danger] = "Please try again."
      redirect_to new_user_path
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :username, :password, :email)
  end

end
