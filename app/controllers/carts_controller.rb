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
    @carts = current_user.carts.where(history: false)
    @total_price = current_user.carts.where(history: false).reduce(0) { |sum, cart| sum + cart.item.price * cart.quantity}.to_f
    current_user.carts.where(history: false).each do |cart|
      if !has_enough_stock(cart.item.id, cart.quantity)
        flash[:error] ||= []
        flash[:error] << "We currently do not have enough #{cart.item.title} in stock, please adjust your quantity according to our inventory."
        enough_stock = false
      end
    end
    p @carts
    if enough_stock
      current_user.carts.where(history: false).each do |cart|
        cart.history = true
        cart.item.quantity -= cart.quantity
        cart.save
        cart.item.save
      end
      render 'thankyou'
    else
      redirect_to user_path(current_user.id)
    end



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
