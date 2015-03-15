class CartItemsController < ApplicationController
  before_action :set_cat, only: [:create, :show]

  def show
    @cats = []
    params[:cart_data].each do |cats_and_quantity|
      cats_and_quantity[1].to_i.times do ||
        @cats << Cat.find(cats_and_quantity[0])
      end
    end
    @cats
    @cart = params[:cart_data]
  end

  def create
    cart_data = session[:cart] || Hash.new(0)
    cart_data[params[:id]] ||= 1
    cart_data[params[:id]] += 1
    session[:cart] = cart_data
    redirect_to cart_path(cart_data: cart_data), alert: "cat added to cart"
  end

  private

  def set_cat
    if params[:id]
      @cat = Cat.find(params[:id])
    end
  end
end
