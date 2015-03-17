module ResetCart

  def reset_cart
    session[:checkout_order] = nil
    session[:cart_items] = nil
    session[:cart_data] = nil
    session[:cart_contents] = nil
  end

end
