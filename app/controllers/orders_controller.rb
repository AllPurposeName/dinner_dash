class OrdersController < ApplicationController

  def index
    authorize! :read, Order
    @orders = current_user.orders
  end

  def show
    @order = Order.find(params[:id])
  end

end
