class Admin::CustomersController < ApplicationController
  def index
    @customers = Customers.all
  end

  def show
    @customer = customer.find(params[:id])
  end

  def edit
    @customer = customer.find(params[:id])
  end

  def update
    customer = Customer.find(params[:id])
    customer.update(customer_params)
  　redirect_to admin_customer_path(customer.id)
  end
end
