class HomeController < ApplicationController

  def index
    @cats = Cat.all

    @breeds = Breed.all
  end

end
