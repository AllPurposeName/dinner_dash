class BreedsController < ApplicationController

  def show
    @breed = Breed.find_by(name: params[:name])
  end

end
