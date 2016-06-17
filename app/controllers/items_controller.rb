class ItemsController < ApplicationController
  # http_basic_authenticate_with name: "admin", password: "secret", except: [:index, :show]

  include SessionsHelper
  include ApplicationHelper

  def admin
    @items = Item.all
    if current_user && current_user.admin
      render "admin"
    else
      flash[:danger] = "Nice try, you're not an admin."
      redirect_to items_path
    end
  end

  def index
    @categories = Category.all
    @items = Item.all

  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @categories = Category.all
    # @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    categories = params[:item][:categories]

    if !categories.empty? && @item.save
      save_categories(categories)
      flash[:success] = "You have entered an item"
      redirect_to admin_path
    else
      flash[:danger] = "Wrong input"
      redirect_to new_item_path
    end
  end

  def edit
    @item = Item.find(params[:id])
    @categories = Category.all
  end

  def update

    @item = Item.find(params[:id])
    categories = params[:item][:categories]

    if !categories.empty? && @item.update(item_params)
      save_categories(categories)
      redirect_to admin_path
    else
      render 'edit'
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    redirect_to admin_path
  end

  private
  def item_params
    params.require(:item).permit(:title, :text, :price, :image, :quantity)
  end

end

