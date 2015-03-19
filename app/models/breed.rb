class Breed < ActiveRecord::Base
  include AttributeUpdater
  before_save :set_image

  has_many :cat_breeds, inverse_of: :breed
  has_many :cats, through: :cat_breeds, inverse_of: :breeds
  validates :name, length: { minimum: 2, maximum: 32 }, uniqueness: true
  validates :description, presence: true

  def set_image
     self.image_path ||= default_pic
  end

  def default_pic
    self.image_path = "#{name.gsub(" ", "_").downcase}.jpg"
  end

  def availability
    if !retired
      return "Available!"
    else
      "Sold out!"
    end
  end

  def to_param
    "#{(name.parameterize.underscore)}"
  end
end
