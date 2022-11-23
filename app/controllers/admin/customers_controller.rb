class Admin::CustomersController < ApplicationController
  def index
    @customers = Customers.all
  end

  def show
    @customer = customer.find(params[:id])
  end

  def edit
  end

  def update
  end
end
