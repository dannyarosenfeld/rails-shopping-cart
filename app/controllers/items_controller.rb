class ItemsController < ApplicationController
  http_basic_authenticate_with name: "admin", password: "secret", except: [:index, :show]

  include SessionsHelper

  def admin
    @items = Item.all
    if !current_user.admin
      flash[:danger] = "Nice try, you're not an admin."
      redirect_to items_path
    else
      render "admin"
    end
  end

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @items = Item.new
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      flash[:success] = "You have entered an item"
      redirect_to admin_path
    else
      flash[:danger] = "Wrong input"
      redirect_to new_item_path
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])

    if @item.update(item_params)
      redirect_to @item
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

