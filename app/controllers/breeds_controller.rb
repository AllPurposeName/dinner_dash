class BreedsController < ApplicationController

  def show
    @breed = Breed.find_by(name: params[:name])
  end

  def edit
    @breed = Breed.find(params[:id])
  end
end
