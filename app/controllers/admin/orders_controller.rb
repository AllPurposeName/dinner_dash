class Admin::OrdersController < ApplicationController
  respond_to :html, :json
  def index
    @orders = Order.all.sort
    @statuses = @orders.map(&:status).uniq
    @statuses.unshift("all")
    respond_with @orders
  end

  def update
    @order = Order.find(params[:id])
    @order.update(status: params[:status])
    render :json => "we good!", :status => :ok
  end
end
