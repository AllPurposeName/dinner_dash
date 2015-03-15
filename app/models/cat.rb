class Cat < ActiveRecord::Base
  include ActiveModel::Validations

  validates :name, length: { minimum: 2, maximum: 32 }
  validates_uniqueness_of :name
  validates :price, presence: true
  validates :image_path, presence: true
  validates :description, presence: true

  # belongs_to :breed


  def availability
    if !retired
      return "Available!"
    else
      "Sold out!"
    end
  end



end
