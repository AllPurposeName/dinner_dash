class Admin::OrdersController < ApplicationController
  respond_to :html, :json
  def index
    @orders = Order.all
    @statuses = @orders.map {|order| order.status}.uniq
    respond_with @orders
  end
end
