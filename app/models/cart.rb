class Cart
attr_reader :contents

  def initialize(cart_data)
    @contents = cart_data || Hash.new(0)
  end

  def add_to_cart(cat)
    @contents[cat] ||= 0
    @contents[cat] += 1
  end

  def remove_from_cart(cat)
    @contents[cat.to_s] ||= 1
    @contents[cat.to_s] -= 1
    if @contents[cat.to_s] == 0
      @contents.delete(cat)
    end
  end
end