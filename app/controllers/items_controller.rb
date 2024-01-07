class ItemsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
  end
 
  def new
    @item = Item.new
  end

  def item_params
    params.require(:item).permit(:name,:explanation,:condition_id,:charge_id,:prefecture_id,:days_required_id,:category_id,:price,:image).merge(user_id: current_user.id)
  end
end
