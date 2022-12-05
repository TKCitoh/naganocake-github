class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @sum = 0
    @order_details = @order.order_details
    @order.shipping_cost = 500
  end

  def update

  end
end
