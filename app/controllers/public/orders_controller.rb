class Public::OrdersController < ApplicationController
  
  before_action :authenticate_customer!
  before_action :request_post?, only: [:confirm]
  before_action :order_new?, only: [:new]

  def new
    @member = current_customer
    @i = current_customer.cart_items
    @all = Item.all
    @i.each do |item|
      @all = @all.where.not(id: item.item_id)
    end
    @item_random = @all.order("RANDOM()").limit(2)

    @order = Order.new
    @address = Address.new
  end

  def comfirm

  end

  def complete
  end

  def create

  end

  def index
    @orders = current_customer.orders
  end

  def show
    @order = Order.find(params[:id]) 
    @order_item = @order.order_items
    @total = 0 
  end
  
  
private

  def order_new?
    redirect_to public_cart_items_path, notice: "カートに商品を入れてください。" if current_customer.cart_items.blank?
  end

  def request_post?
    redirect_to new_public_order_path, notice: "もう一度最初から入力してください。" unless request.post?
  end

  def order_params
    params.require(:order).permit(:payment_method, :address, :shipping_cost, :postal_code, :name, :total_payment)
  end

  def address_params
    params.permit(:shipping_address, :name, :postal_code, :member_id)
  end

end
