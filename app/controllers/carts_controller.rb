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

  def checkout
    enough_stock = true
    current_user.carts.where(history: false).each do |cart|
      if !has_enough_stock(cart.item.id, cart.quantity)
        flash[:error] ||= []
        flash[:error] << "We currently do not have enough #{cart.item.title} in stock, please adjust your quantity according to our inventory."
        enough_stock = false
      end
    end

    if enough_stock
      current_user.carts.where(history: false).each do |cart|
        cart.history = true
        cart.item.quantity -= cart.quantity
        cart.save
        cart.item.save
      end
    end

    redirect_to user_path(current_user.id)
  end

  def edit
    @cart = Cart.find(params[:id])
    @item = @cart.item
  end

  def update
    @cart = Cart.find(params[:id])
    @cart.quantity = params[:quantity]
    item = Item.find(params[:item_id])
    if has_enough_stock(params[:item_id], params[:quantity]) && @cart.save
      redirect_to user_path(current_user.id)
    else
      flash[:error] = "Please enter valid number between 1 and #{item.quantity}"
      redirect_to "/carts/#{@cart.id}/edit"
    end
  end

  def destroy
    @cart = Cart.find(params[:id])
    @cart.destroy

    redirect_to user_path(current_user.id)

  end



end
