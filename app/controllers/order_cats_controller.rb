class OrderCatsController < ApplicationController

  def create
    #build an order for the user
    #use the session to create all of the rows for that order
    #reset cart
    #save
    user = User.find(current_user.id)
    order = user.orders.create
    session[:checkout_order].each do |cat_and_quantity|
      order.order_cats.create(cat_id: cat_and_quantity[0]["id"], quantity: cat_and_quantity[1])
    end
    redirect_to order_path(order.id)


  end

end
