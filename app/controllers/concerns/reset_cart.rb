module ResetCart
  def reset_cart
    session[:cart_data] = nil
  end
end
