class SessionsController < ApplicationController

  def new

  end


  def create
    user = User.find_by(username: params[:session][:username])
    current_user = user
    if user.admin?
      flash[:welcomeadmin] = "Welcome, #{user.username.capitalize}!"
      redirect_to '/admin/inventory'
    elsif user && user.authenticate(params[:session][:password])
      redirect_to '/'
    else
      flash[:tryagain] = "Whoops, try again"
      render :new
    end
  end
end
