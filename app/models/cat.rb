class Cat < ActiveRecord::Base


  def availability
    if !retired
      return "Available!"
    else
      "Sold out!"
    end
  end

end
