class ItemsController < ApplicationController
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

    @item.save
    redirect_to @item
  end

  def edit
  end

  def delete
  end

  private
  def item_params
    params.require(:item).permit(:title, :text, :price)
  end

end

