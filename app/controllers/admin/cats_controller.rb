class Admin::CatsController < ApplicationController
  respond_to :html, :json
  before_action :set_cat, only: [:show, :edit, :update]

  def show
    authorize! :read, Cat
  end

  def new
    authorize! :create, Cat
    @cat = Cat.new
  end

  def create
    authorize! :create, Cat
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
    authorize! :update, Cat
  end

  def update
    authorize! :update, Cat
    sanitize_cat_name
    @cat.update_some_attributes(params[:cat])
    flash[:editcomplete] = "#{@cat.name.humanize} edited!"
    redirect_to edit_admin_cat_path(@cat.to_param)
  end

  def retired_update
    cat = Cat.find(params[:id])
    cat.change_retired
    render :json => "we good!", :status => :ok
  end

  def cat_params
    params.require(:cat).permit(:name,
                                :description,
                                :image_path,
                                :retired,
                                :price)
  end

  private

  def set_cat
    @cat = Cat.find(params[:id])
  end

  def sanitize_cat_name
    params[:cat][:name].downcase
  end
end
