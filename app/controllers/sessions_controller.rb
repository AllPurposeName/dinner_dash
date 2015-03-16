class SessionsController < ApplicationController

  def new

  end


  def create
    user = User.find_by(username: params[:session][:username])
    if !user
    return try_again
    end
    current_user = user
    if user.admin? && user.authenticate(params[:session][:password])
      flash[:welcomeadmin] = "Welcome, admin #{user.username.capitalize}!"
      redirect_to '/admin/inventory'
    elsif user && user.authenticate(params[:session][:password])
      redirect_to '/'
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
