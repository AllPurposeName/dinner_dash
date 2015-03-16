class OrderCatsController < ApplicationController

  def create
    #build an order for the user
    #use the session to create all of the rows for that order
    #reset cart
    #save
    user = User.find(current_user.id)
    order = user.orders.build
    order.save
    redirect_to order_path(order.id)
  end

end
