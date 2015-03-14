class CatsController < ApplicationController
  before_action :set_cat

  def index
    @cats = Cat.all
  end

  def show
  end

  def edit
  end

  private

  def set_cat
    @cat = Cat.find(params[:id])
  end

end
