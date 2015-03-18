class Admin::BreedsController < ApplicationController
  before_action :set_breed, only: [:edit, :update]

  def show

  end

  def new
    @breed = Breed.new
  end

  def create
    @breed = Breed.new(breed_params)
    if @breed.save
      flash[:newcomplete] = "#{@breed.name.humanize} created!"
      redirect_to admin_breed_path(@breed)
    else
      flash[:newfail] = "Please fill every field in with a valid entry"
      redirect_to new_admin_breed_path
    end
  end

  def edit
  end

  def update
    params[:breed][:name].downcase
    @breed.update_some_attributes(params[:breed])
    flash[:editcomplete] = "#{@breed.name.humanize} edited!"
    redirect_to edit_admin_breed_path(@breed.to_param)
  end

  def breed_params
    params.require(:breed).permit(:name, :description, :image_path, :retired)
  end


  private

  def set_breed
    @breed = Breed.find_by(name: params[:id].humanize)
  end

end
