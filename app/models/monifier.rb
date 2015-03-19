class Monifier
  def monify(not_money)
    not_money.to_s.insert(-3, ".").insert(0, "$")
  end
end
