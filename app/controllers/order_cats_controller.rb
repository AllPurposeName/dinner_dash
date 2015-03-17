class OrderCatsController < ApplicationController
  include ResetCart
  def create
    authorize! :create, Order
    if @cart.cats_and_quantity
      order = current_user.orders.create
      @cart.create_order_cats(order)
      reset_cart
      redirect_to order_path(order.id)
    else
      redirect_to cart_path
    end
  end
end
