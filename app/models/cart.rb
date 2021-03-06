class Cart
  include Monify
  attr_reader :contents, :cats_and_quantity, :price

  def initialize(cart_data)
    @contents = cart_data || Hash.new(0)
    update
  end

  def add_to_cart(cat)
    @contents[cat.to_s] ||= 0
    @contents[cat.to_s] += 1
  end

  def remove_from_cart(cat)
    @contents.delete(cat)
  end

  def subtract_from_cart(cat)
    @contents[cat.to_s] ||= 1
    @contents[cat.to_s] -= 1
    if @contents[cat.to_s] == 0
      @contents.delete(cat)
    end
  end

  def create_order_cats(order)
    cats_and_quantity.each do |cat_and_quantity|
      order.order_cats.create(cat_id: cat_and_quantity[0]["id"],
                              quantity: cat_and_quantity[1])
    end
  end

  def total_monify
    monify
  end

  private

  def update
    if !@contents.any? do |content|
      content[0].empty?
    end
      set_cats_and_quantity
      sum_price
    end
  end

  def set_cats_and_quantity
    cats = []
    quantity = []
    contents.each do |cats_and_quantity|
      quantity << cats_and_quantity[1].to_i
      cats << Cat.find(cats_and_quantity[0])
    end
    @cats_and_quantity = cats.zip(quantity)
  end

  def sum_price
    @price = cats_and_quantity.inject(0) do |sum, item|
      sum += (item[0].price * item[1])
      sum
    end
  end
end
