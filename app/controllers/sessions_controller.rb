class SessionsController < ApplicationController

  def new

  end


  def create
    user = User.find_by(username: params[:session][:username])
    current_user = user
    if user && user.authenticate(params[:session][:password])
      redirect_to '/'
    else
      flash[:tryagain] = "Whoops, try again"
      render :new
    end
  end
end
