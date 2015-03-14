FactoryGirl.define do
  # sequence(:name) { |n| "Sabertooth #{n}"}

  factory :breed do
    name
    image_path "MyText"
    retired false
    description "A long fanged feline for your long suffering appetite!"
  end

end
