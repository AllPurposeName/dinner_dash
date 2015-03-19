class Admin::OrdersController < ApplicationController
  respond_to :html, :json
  def index
    @orders = Order.all
    @statuses = @orders.map(&:status).uniq
    @statuses.unshift("all")
    respond_with @orders
  end
end
