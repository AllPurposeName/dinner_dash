module AttributeUpdater
  def update_some_attributes(param_info)
    param_info.each do |attr_hash|
      update_attribute(attr_hash[0].to_sym, attr_hash[1].humanize)
    end
  end
end
