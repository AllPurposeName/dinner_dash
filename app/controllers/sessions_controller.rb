class SessionsController < ApplicationController

  def new

  end


  def create
    user = User.find_by(username: params[:session][:username])
    if !user
      return try_again
    end
    if user.admin? && user.authenticate(params[:session][:password])
      flash[:welcomeadmin] = "Welcome, #{user.username.capitalize}!"
      redirect_to '/admin/inventory'
      session[:user_id] = user.id
    elsif user && user.authenticate(params[:session][:password])
      redirect_to '/'
      session[:user_id] = user.id
    else
      try_again
    end
  end

  private

  def try_again
    flash[:tryagain] = "Whoops, try again"
    render :new
  end
end
