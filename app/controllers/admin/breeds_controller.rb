class Admin::BreedsController < ApplicationController

  def edit
    @breed = Breed.find_by(name: params[:id])
  end
end
