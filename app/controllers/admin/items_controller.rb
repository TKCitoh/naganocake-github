class Admin::ItemsController < ApplicationController
  def index
    @item = Item.all
  end

  def new
    @item = Item.new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end
end
