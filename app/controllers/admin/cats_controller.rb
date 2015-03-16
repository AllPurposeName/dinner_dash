class Admin::CatsController < ApplicationController
  before_action :set_cat, only: [:edit]


  def edit

  end

  private

  def set_cat
    @cat = Cat.find(params[:id])
  end

end
