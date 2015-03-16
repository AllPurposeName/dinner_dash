class HomeController < ApplicationController
  before_action :set_cats, :set_breeds
  def show

  end


  private

  def set_breeds
    @breeds = Breed.all
  end

  def set_cats
    @cats = Cat.all
  end
end
