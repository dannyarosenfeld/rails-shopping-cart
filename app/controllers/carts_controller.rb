class CartsController < ApplicationController
  include SessionsHelper
  include ApplicationHelper

  def new
    @item = Item.find(params[:item_id])
    p params
  end

  def create
    @cart = Cart.new(user_id: current_user.id, item_id: params[:item_id], quantity: params[:quantity])
    item = Item.find(params[:item_id])
    if has_enough_stock(params[:item_id], params[:quantity]) && @cart.save
      redirect_to user_path(current_user.id)
    else
      flash[:error] = "Please enter valid number between 1 and #{item.quantity}"
      redirect_to "/carts/new?item_id=#{params[:item_id]}"
    end
  end


end
