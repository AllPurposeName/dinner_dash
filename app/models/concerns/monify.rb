module Monify
  def monify
    if price > 0
      price.to_s.insert(-3, ".").insert(0, "$")
    end
  end
end
