class BreedsController < ApplicationController


  def index
    # binding.pry

    @breeds = Breed.all
  end

  def show
    # binding.pry
    @breed = Breed.find_by(name: params[:name])
  end

end
