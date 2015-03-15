class Breed < ActiveRecord::Base

  has_many :cat_breeds
  has_many :cats, :through => :cat_breeds



  def availability
    if !retired
      return "Available!"
    else
      "Sold out!"
    end
  end

  def to_param
    "#{(name.parameterize)}"
  end

end
