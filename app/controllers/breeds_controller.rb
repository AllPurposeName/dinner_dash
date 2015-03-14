class BreedsController < ApplicationController


  def index
    # binding.pry

    @breeds = Breed.all
  end

  def show
    @breed = Breed.find_by(name: params[:name])
  end

  def edit
    @breed = Breed.find(params[:id])
  end
end
