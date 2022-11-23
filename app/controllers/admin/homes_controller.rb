class Admin::HomesController < ApplicationController
  def top
    @orders = Orders.all
  end
end
