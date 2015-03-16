class Cart < ActiveRecord::Base
attr_reader :contents

  def initialize(cart_data)
    @contents = cart_data || Hash.new(0)
  end

  def add_to_cart(cat)
    @contents[cat] ||= 1
    @contents[cat] += 1
  end
end
