class OrdersController < ApplicationController

  def index
    authorize! :read, Order
    @orders = current_user.orders
    @monifier = Monifier.new
  end

  def show
    @order = Order.find(params[:id])
    @monifier = Monifier.new
  end

end
