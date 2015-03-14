FactoryGirl.define do
  sequence(:name) { |n| "Cat #{n}"}

  factory :cat do
    name
    price 3000
    retired false
    image_path "MyText"
    description "MyText"
  end

end
