class HomeController < ApplicationController

  def index
    @cats = Cat.all
  end

end
