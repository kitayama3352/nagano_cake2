class Admin::ItemsController < ApplicationController

  def index
    @items = Item.page(params[:page]).per(10)
  end

  def new
    @item = Item.new

  end

  def create
   @item = Item.new(item_params)
     if @item.save
      redirect_to admin_item_path(@item)
     else
      redirect_to admin_path
     end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to admin_item_path(@item.id)
  end


private

  def item_params
  	params.require(:item).permit(:genre_id,:name,:price,:is_active,:introduction,:image_id)
  end


end
