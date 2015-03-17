class Breed < ActiveRecord::Base

  has_many :cat_breeds
  has_many :cats, through: :cat_breeds



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

  def update_some_attributes(breed_info)
    breed_info.each { |attr_hash| self.update_attribute(attr_hash[0].to_sym, attr_hash[1].humanize) }
  end


end
