class OrdersController < ApplicationController

  def index
    @orders = current_user.orders
  end

  def show
  end

end
