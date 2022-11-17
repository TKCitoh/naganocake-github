class Admin::ItemsController < ApplicationController
  def index
    @item = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    item = Itme.new(item_params)
    item.save
    redirect_to admin_item_path
  end

  def show
  end

  def edit
  end

  def update
  end

  private
  # ストロングパラメータ
  def item_params
    params.require(:item).permit(:name,:introduction,:price,:image)
  end
end
