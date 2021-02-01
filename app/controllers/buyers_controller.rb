class BuyersController < ApplicationController
  before_action :item_data
  

  def index
    @buy_info = BuyInfo.new
  end

  def create
    @buy_info = BuyInfo.new(info_params)
     if @buy_info.valid?
      @buy_info.save
      redirect_to root_path
     else
      render  :index
     end
  end

  private

  def info_params
    params.require(:buy_info).permit(:post_code, :ship_region_id, :city, :block, :building, :phone).merge(user_id: current_user.id, item_id: @item.id)
  end

  def item_data
    @item = Item.find(params[:item_id])
  end

end
