class UsersController < ApplicationController
  include SessionsHelper

  def show
    if current_user
      @user = current_user
      @total_price = @user.carts.where(history: false).reduce(0) { |sum, cart| sum + cart.item.price * cart.quantity}.to_f
    else
      redirect_to '/'
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      ExampleMailer.sample_email(@user).deliver

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
