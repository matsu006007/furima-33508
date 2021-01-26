class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @items = Item.includes(:user).order('items.created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  #def edit
    #@item = Item.find(params[:id])
  #end

  private

  def item_params
    params.require(:item).permit(:product_name, :product_description, :price, :category_id, :product_status_id, :freight_id,
                                 :ship_region_id, :ship_date_id, :image).merge(user_id: current_user.id)
  end
end
