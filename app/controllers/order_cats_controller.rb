class OrderCatsController < ApplicationController
  include ResetCart
  def create
    authorize! :create, Order
    user = current_user
    if session[:checkout_order]
      order = user.orders.create
      session[:checkout_order].each do |cat_and_quantity|
        order.order_cats.create(cat_id: cat_and_quantity[0]["id"], quantity: cat_and_quantity[1])
      end
      reset_cart
      redirect_to order_path(order.id)
    else
      redirect_to cart_path
    end
  end
end
