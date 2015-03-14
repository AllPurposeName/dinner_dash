class Breed < ActiveRecord::Base



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
