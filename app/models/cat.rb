class Cat < ActiveRecord::Base
  include ActiveModel::Validations

  has_many :cat_breeds
  has_many :breeds, through: :cat_breeds

  validates :name, length: { minimum: 2, maximum: 32 }
  validates_uniqueness_of :name
  validates :price, presence: true
  validates :image_path, presence: true
  validates :description, presence: true



  def availability
    if !retired
      return "Available!"
    else
      "Sold out!"
    end
  end



end
