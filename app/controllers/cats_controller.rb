class CatsController < ApplicationController

  def show
    @cat = Cat.find_by(name: params[:name])
  end

end
