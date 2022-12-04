class Public::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.all
    @sum = 0
  end

  def update
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to public_cart_items_path
  end

  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to public_cart_items_path
  end

  def create
    cart_item = current_customer.cart_items.new(cart_item_params)
    if current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
      cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
      cart_item.amount += params[:cart_item][:item_id].to_i
      cart_item.save
      redirect_to public_cart_items_path
    elsif cart_item.save
      redirect_to public_cart_items_path
    else
      @cart_iten = CartItem.new
    end
  end

  private
  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount)
  end
end
