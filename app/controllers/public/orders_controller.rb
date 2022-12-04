class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def confirm
    @order = Order.new(order_params)
    @cart_items = CartItem.all
    @sum = 0
    @order.shipping_cost = 500
    if params[:order][:address_select] == "ご自身の住所"
       @order.postal_code = current_customer.postal_code
       @order.address = current_customer.address
       @order.name = current_customer.first_name + current_customer.last_name
    elsif params[:order][:address_select] == "登録済み住所から選択"
       @address = Address.find(params[:order][:address_id])
       @order.postal_code = @address.postal_code
       @order.address = @address.address
       @order.name = @address.name
    else
    end
  end

  def complete
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
    current_customer.cart_items.each do |cart_item|
      @order_detail = OrderDetail.new
      @order_detail.item_id = cart_item.item_id #商品idの代入
      @order_detail.amount = cart_item.amount #個数の代入
      @order_detail.price = cart_item.item.with_tax_price #価格の代入
      @order_detail.order_id =  @order.id #注文idの代入
      @order_detail.save
    end
    current_customer.cart_items.destroy_all
    redirect_to complete_public_orders_path
  end

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @sum = 0
    @order_details = @order.order_details #特定した@orderからorder_detailsを全てとる
  end

  private
  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name, :total_amount, :shipping_cost)
  end
end
