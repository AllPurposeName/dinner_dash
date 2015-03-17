class Admin::BreedsController < ApplicationController
  before_action :set_breed, only: [:edit, :update]
  def edit
  end

  def update
    params[:breed][:name].downcase
    @breed.update_some_attributes(params[:breed])
    flash[:editcomplete] = "#{@breed.name.humanize} edited!"
    redirect_to edit_admin_breed_path(@breed.to_param)
  end

  private

  def set_breed
    @breed = Breed.find_by(name: params[:id].humanize)
  end

end
