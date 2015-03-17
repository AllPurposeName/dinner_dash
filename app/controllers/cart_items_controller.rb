class CartItemsController < ApplicationController

  def show
    if @cart.cats_and_quantity
        @cart
      render :show
    else
        flash[:emptycart] = "You're cart is empty, fill it with some kittens plz"
      redirect_to root_path
    end
  end

  def create
    @cart.add_to_cart(params[:id])
    session[:cart_data] = @cart.contents
    redirect_to cart_path, alert: "cat added to cart"
  end

  def delete
    @cart.remove_from_cart(params[:id])
    session[:cart_data] = @cart.contents
    redirect_to cart_path(cart_contents: @cart.contents)
  end


end
