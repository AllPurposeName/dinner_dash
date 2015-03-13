class SessionsController < ApplicationController

  def new

  end


  def create
    user = User.find_by(username: params[:session][:username])
    current_user = user
    redirect_to '/'
  end
end
