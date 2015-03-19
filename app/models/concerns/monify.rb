module Monify
  def monify
    self.price.to_s.insert(-3, ".").insert(0, "$")
  end
end
