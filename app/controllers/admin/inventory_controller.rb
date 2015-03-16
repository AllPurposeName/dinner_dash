class Admin::InventoryController < ApplicationController
  before_action :set_cats, :set_breeds
  def index

  end

  private

  def set_cats
    @cats = Cat.all
  end

  def set_breeds
    @breeds = Breed.all
  end

end
