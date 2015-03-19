class Admin::OrdersController < ApplicationController
  respond_to :html, :json
  def index
    authorize! :update, Order
    @orders = Order.all.sort
    @statuses = ["all", "ordered", "paid", "completed", "cancelled"]
    respond_with @orders
  end

  def update
    authorize! :update, Order
    @order = Order.find(params[:id])
    @order.update(status: params[:status])
    render :json => "we good!", :status => :ok
  end
end
