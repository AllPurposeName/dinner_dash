class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  rescue_from CanCan::AccessDenied do |exception|
    if !@current_user
      redirect_to login_path, alert: exception.message
    else
      redirect_to root_path, alert: exception.message
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  helper_method :current_user

  def load_cart
    @cart ||= Cart.new(session[:cart_data])
  end

  def not_found
    flash[:notice] = "Just Kitten"
    redirect_to root_path
  end

  helper_method :load_cart
  before_action :load_cart
end
