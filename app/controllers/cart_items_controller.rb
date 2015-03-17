class CartItemsController < ApplicationController
  before_action :set_cat, only: [:create, :delete]

  def show
    cats = []
    quantity = []
    params[:cart_contents].each do |cats_and_quantity|
      quantity << cats_and_quantity[1].to_i
      cats << Cat.find(cats_and_quantity[0])
    end
    @cats_and_quantity = cats.zip(quantity)
    session[:checkout_order] = @cats_and_quantity
    @total_price = total_price(@cats_and_quantity)
  end

  def create
    @cart.add_to_cart(@cat.id)
    session[:cart_data] = @cart.contents
    redirect_to cart_path(cart_contents: @cart.contents), alert: "cat added to cart"
  end

  def delete
    @cart.remove_from_cart(@cat.id)
    session[:cart_data] = @cart.contents
    redirect_to cart_path(cart_contents: @cart.contents)
  end

  def set_cat
    if params[:id]
      @cat = Cat.find(params[:id])
    end
  end

  def total_price(c_and_q)
    c_and_q.inject(0) do |sum, item|
      sum += (item[0].price * item[1])
      sum
    end
  end
end
