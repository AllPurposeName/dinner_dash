class Admin::CatsController < ApplicationController
  before_action :set_cat, only: [:edit, :update]


  def edit

  end

  def update
    params[:cat][:name].downcase
    if @cat.update_some_attributes(params[:cat])
      flash[:editcomplete] = "#{@cat.name.humanize} edited!"
      redirect_to edit_admin_cat_path(@cat.to_param)
    else
      flash[:editfailed] = "Please try to edit again"
      render :edit
    end
  end
  private

  def set_cat
    @cat = Cat.find(params[:id])
  end

end
