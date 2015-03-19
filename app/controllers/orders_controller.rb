class OrdersController < ApplicationController

  def index
    authorize! :read, Order
    @orders = current_user.orders
  end

  def show
    authorize! :read, Order
    @order = Order.find(params[:id])
  end

end
