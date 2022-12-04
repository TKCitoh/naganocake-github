class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def confirm
    @order = Order.new(order_params)
    @cart_items = CartItem.all
    @sum = 0
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
    order = Order.find(params[:id])
    order.update(order_params)
    redirect_to complete_public_orders_path
  end

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  private
  def order_params
  params.require(:order).permit(:payment_method, :postal_code, :address, :name)
  end
end
