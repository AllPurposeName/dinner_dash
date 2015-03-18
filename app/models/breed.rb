class Breed < ActiveRecord::Base
  include AttributeUpdater

  has_many :cat_breeds
  has_many :cats, through: :cat_breeds

  validates :name, length: { minimum: 2, maximum: 32 }, uniqueness: true
  validates :description, presence: true

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
