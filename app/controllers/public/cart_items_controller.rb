class Public::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.all
    @sum = 0
  end

  def update
  end

  def destroy
  end

  def destroy_all
    current_user.books.destroy_all
  end

  def create
    if current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
      same_cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
      same_cart_item.amount = same_cart_item.amount + params[:cart_item][:amount].to_i
      same_cart_item.update(amount: same_cart_item.amount)
    else
      @cart_iten = CartItem.new
    end
  end

  private
  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount)
  end
end
