class BreedsController < ApplicationController


  def index
    @breeds = Breed.all
  end

  def show
    @breed = Breed.find_by(name: params[:name])
    @cats = @breed.cats
  end

end
