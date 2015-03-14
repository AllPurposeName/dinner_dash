FactoryGirl.define do

  factory :breed do
    sequence(:name) { |n| "Breed #{n}"}
    image_path "MyText"
    retired false
    description "A long fanged feline for your long suffering appetite!"
  end

end
