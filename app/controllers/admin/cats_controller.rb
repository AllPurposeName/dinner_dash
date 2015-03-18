class Admin::CatsController < ApplicationController
  before_action :set_cat, only: [:show, :edit, :update]

  def show
  end

  def new
    @cat = Cat.new
  end

  def create
    @cat = Cat.new(cat_params)
    if @cat.save
      flash[:newcomplete] = "#{@cat.name.humanize} created!"
      redirect_to admin_cat_path(@cat)
    else
      flash[:newfail] = "Please fill every field in with a valid entry"
      redirect_to new_admin_cat_path
    end
  end

  def edit

  end

  def update
    params[:cat][:name].downcase
    @cat.update_some_attributes(params[:cat])
    flash[:editcomplete] = "#{@cat.name.humanize} edited!"
    redirect_to edit_admin_cat_path(@cat.to_param)
  end

  def cat_params
    params.require(:cat).permit(:name, :description, :image_path, :retired, :price)
  end


  private

  def set_cat
    @cat = Cat.find(params[:id])
  end

end
