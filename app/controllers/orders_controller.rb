class OrdersController < ApplicationController
    before_action :set_item, only: [:index, :create ]

    def index
      # @item = Item.find_by(id: params[:item_id])
      @order_address = OrderAddress.new
    end

    def create
      @order_address = OrderAddress.new(order_params)
      # @item = Item.find_by(id: params[:item_id])
      if @order_address.valid?
        @order_address.save
        redirect_to root_path
      else
        render :index, status: :unprocessable_entity
      end
    end

    private

    def order_params
      params.require(:order_address).permit(:post_code, :prefecture_id, :municipality, :street_address, :building_name, :telephonenumber)
      .merge(user_id: current_user.id, item_id: @item.id)
    end

    def set_item
      @item = Item.find_by(id: params[:item_id])
    end
end
