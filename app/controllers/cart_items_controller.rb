class CartItemsController < ApplicationController
  before_action :set_cat, only: [:create]

  def show
    @cats = []
    params[:cart_contents].each do |cats_and_quantity|
      cats_and_quantity[1].to_i.times do ||
        @cats << Cat.find(cats_and_quantity[0])
      end
    end
    @cats
    @cart = params[:cart_data]
  end

  def create
    @cart.add_to_cart(@cat.id)
    session[:cart_data] = @cart.contents
    redirect_to cart_path(cart_contents: @cart.contents, id: @cat.id), alert: "cat added to cart"
  end

  private

  def set_cat
    if params[:id]
      @cat = Cat.find(params[:id])
    end
  end
end
